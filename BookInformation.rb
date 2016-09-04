require "sinatra"

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