# 概要

FlutterでObjectBox（ローカルDB）を利用したアプリを作成するためのガイドプロジェクトです。

# 前提条件

- Flutterをインストールしていること
    - Windows環境構築手順
        - https://blog.css-net.co.jp/entry/2022/05/30/133942
- Android Studioをインストールしていること
- GitHubアカウントを持っていること

# ハンズオンをすすめるにあたって

このハンズオンをすすめるにあたってPull Requestの作成およびレビューを求める箇所があります。 ただ、ご自身のみで進めても問題ございませんので必要がないと判断されれば特にPull Requestの作成やレビュー依頼はせず進めてもらって結構です。

# 準備

まずはこのハンズオンのリポジトリをforkしてください。 forkできましたら、ご自身のローカルPCにcloneしてエディタでプロジェクトを開いてください。

参考: https://docs.github.com/ja/get-started/quickstart/fork-a-repo

# 追加するパッケージについて

## dependenciesに追加

- objectbox
    - https://pub.dev/packages/objectbox
- objectbox_flutter_libs
    - https://pub.dev/packages/objectbox_flutter_libs

下記コマンドをターミナルで実行

`flutter pub add objectbox objectbox_flutter_libs`

## dev_dependenciesに追加

- build_runner
    - https://pub.dev/packages/build_runner
- objectbox_generator
    - https://pub.dev/packages/objectbox_generator

下記コマンドをターミナルで実行

`flutter pub add -d build_runner objectbox_generator`

# 起動手順

1. Android Studioでエミュレータを作成
    - https://blog.css-net.co.jp/entry/2022/06/06/112045
2. デバイスを選択し、起動
3. エミュレータで実行
    - https://developer.android.com/training/basics/firstapp/running-app?hl=ja#Emulator

# スクリーンショット
![shoppingmemo](https://user-images.githubusercontent.com/97335620/205445395-1d9506f5-affb-4142-9887-8a46de96298d.png)


