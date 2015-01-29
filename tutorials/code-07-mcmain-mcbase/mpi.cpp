/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *                                                                                 *
 * ALPS Project: Algorithms and Libraries for Physics Simulations                  *
 *                                                                                 *
 * ALPS Libraries                                                                  *
 *                                                                                 *
 * Copyright (C) 2010 - 2013 by Lukas Gamper <gamperl@gmail.com>                   *
 *                                                                                 *
 * This software is part of the ALPS libraries, published under the ALPS           *
 * Library License; you can use, redistribute it and/or modify it under            *
 * the terms of the license, either version 1 or (at your option) any later        *
 * version.                                                                        *
 *                                                                                 *
 * You should have received a copy of the ALPS Library License along with          *
 * the ALPS Libraries; see the file LICENSE.txt. If not, the license is also       *
 * available from http://alps.comp-phys.org/.                                      *
 *                                                                                 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        *
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT       *
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE       *
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,     *
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER     *
 * DEALINGS IN THE SOFTWARE.                                                       *
 *                                                                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "ising.hpp"

#include <alps/parseargs.hpp>
#include <alps/mcmpiadapter.hpp>
#include <alps/stop_callback.hpp>
#include <alps/ngs/make_parameters_from_xml.hpp>

#include <boost/chrono.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/filesystem/path.hpp>

#include <string>
#include <iostream>
#include <stdexcept>

int main(int argc, char *argv[]) {

    try {
        boost::mpi::environment env(argc, argv);
        boost::mpi::communicator comm;

        alps::parseargs options(argc, argv);
        std::string checkpoint_file = options.input_file.substr(0, options.input_file.find_last_of('.')) 
                                    +  ".clone" + boost::lexical_cast<std::string>(comm.rank()) + ".h5";

        alps::parameters_type<ising_sim>::type parameters;
        if (comm.rank() > 0)
            /* do nothing */ ;
        else if (boost::filesystem::extension(options.input_file) == ".xml")
            parameters = alps::make_parameters_from_xml(options.input_file);
        else if (boost::filesystem::extension(options.input_file) == ".h5")
            alps::hdf5::archive(options.input_file)["/parameters"] >> parameters;
        else
            parameters = alps::parameters_type<ising_sim>::type(options.input_file);
        broadcast(comm, parameters);

        alps::mcmpiadapter<ising_sim> sim(parameters, comm, alps::check_schedule(options.tmin, options.tmax));

        if (options.resume)
            sim.load(checkpoint_file);

        // TODO: how do we handle signels in mpi context? do we want to handle these in the callback or in the simulation?
        // do not use stop_callback_mpi: we do not want an bcast after every sweep!
        //  Additionally this causes a race cond and deadlocks as mcmpiadapter::run will always call the stop_callback broadcast
        //  but only sometimes all_reduce on the fraction. Timers on different procs are not synchronized so they may not agree
        //  on the mpi call.
        sim.run(alps::stop_callback(comm, options.timelimit));

        sim.save(checkpoint_file);

        using alps::collect_results;
        alps::results_type<ising_sim>::type results = collect_results(sim);

        if (comm.rank() == 0) {
            std::cout << results << std::endl;
            alps::hdf5::archive ar(options.output_file, "w");
            ar["/parameters"] << parameters;
            ar["/simulation/results"] << results;
        }

    } catch (std::exception const & e) {
        std::cerr << "Caught exception: " << e.what() << std::endl;
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}
