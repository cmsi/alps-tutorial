parms = []
for t in [1.5,2,2.5]:
   parms.append(
       { 
         'LATTICE'        : "square lattice", 
         'T'              : t,
         'J'              : 1 ,
         'THERMALIZATION' : 1000,
         'SWEEPS'         : 100000,
         'UPDATE'         : "cluster",
         'MODEL'          : "Ising",
         'L'              : 8
       }
   )
