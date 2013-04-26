ALPS/tutorial
=============

Japanese tutorial materials for ALPS Library/Application (http://alps.comp-phys.org)

ALPS講習会のための日本語資料

Table of Contents / 内容
============================

* Overview of ALPS Project / ALPSの概要
* ALPS Library / ALPSライブラリ
* Tutorial for running ALPS applications / ALPSアプリケーション実行チュートリアル
* Python
* Introduction to ALPS Python / ALPS Python入門
* Introduction to Matplotlib / Matplotlib入門
* How to ``alpsize'' your application / アプリケーションのALPS化
* Installation of ALPS / ALPSのインストール

Authors / 著者
=================

* Synge Todo (ISSP, Univ. of Tokyo) / 藤堂眞治 (東大物性研)
* Haruhiko Matsuo (RIST) / 松尾春彦 (RIST)
* Ryo Igarashi (ISSP, Univ. of Tokyo) / 五十嵐 亮 (東大物性研)

Branch 命名規則
==================

* http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html に従う

リリース方法
====================

* developブランチからreleaseブランチを作成 (例: git checkout -b release-20130401 develop)
* style/alpstutorial.sty 中の講習会名(author), 講習会日時(date)を修正しcommit (例: git commit -a -m 'Bumped version number to 20130401')
* make_dist.sh を実行し, できあがったPDFファイルの中身を確認
* commitが完了したら, masterにマージしtagを付ける (例: git checkout master; git merge --no-ff release-20130401; git tag -a 20130401)
* developにマージした後, リリースブランチを削除 (例: git checkout develop; git merge --no-ff release-20130401; git branch -d release-20130401)

PDF作成方法
================

* sh make_dist.sh
