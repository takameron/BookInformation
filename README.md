# README #

この「本評価共有アプリ」は、H28夏季休業中の課題として作成したものです。  
課題はとにかく何かWebアプリケーションを作成するという課題でした。  
詳しくはmemos.mdをご覧ください。

## INSTALL

### Windows
```
#RailsInstaller(http://railsinstaller.org/en)でRubyなどのインストール
git clone https://github.com/t-iwabuchi/BookInformation.git
gem install bundler

bundle install --path vendor/bundle
#エラーが発生した場合は、Gemfile.lockを削除してみる

bundle exec ruby Bookinformation.rb

#ブラウザで localhost:4567 にアクセス
```

### Ubuntu
```
git clone https://github.com/t-iwabuchi/BookInformation.git
gem install bundler

sudo apt-get install sqlite3 libsqlite3-dev
bundle install --path vendor/bundle
#エラーが発生した場合は、Gemfile.lockを削除してみる

bundle exec ruby BookInformation.rb

#ブラウザで localhost:4567 にアクセス
```

