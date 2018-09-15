# README #

この「本評価共有アプリ」は、H28夏季休業中の課題として作成したものです。  
課題はとにかく何かWebアプリケーションを作成するという課題でした。  
詳しくはmemos.mdをご覧ください。

## INSTALL
```
git clone https://programmingprivate@bitbucket.org/programmingprivate/bookinformation.git
gem install bundler

#Ubuntuの場合
sudo apt-get install sqlite3 libsqlite3-dev
#Windowsの場合は、知らない

bundle install --path vendor/bundle
#エラーが発生した場合は、Gemfile.lockを削除してみる

bundle exec ruby Bookinformation.rb

#ブラウザで localhost:4567 にアクセス
```

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact