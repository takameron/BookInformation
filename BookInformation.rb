require 'sinatra'
require 'sqlite3'

#データベースの準備
before do
	@db = SQLite3::Database.new("BookInformation")
end
after do
	@db.close
end

#メインページ
get '/' do
	erb :index
end

#閲覧ページ
get '/browse/:ISBN' do
	erb :browse
end

#登録ページ
get '/registration' do
	erb :registration
end

#アプリケーション紹介ページ
get '/about' do
	erb :about
end