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
	erb :index ,layout: :layout
end

#閲覧ページ
get '/browse/:ISBN' do
	@ISBN = params["ISBN"].to_i
	#閲覧数更新
	sql = <<-SQL
		SELECT views FROM BookInformation WHERE isbn = @ISBN
	SQL
	@data = @db.execute(sql)
	@data++
	sql = <<-SQL
		UPDATE BookInformation SET views=@data WHERE isbn = @ISBN
	SQL
	@db.execute(sql)

	erb :browse ,layout: :layout
end

#登録ページ
get '/registration' do
	erb :registration ,layout: :layout
end

#登録作業
get '/registration/insert' do
	@isbn = params["isbn"].to_i
	@bookTitle = params["title"]
	@bookAuthor = params["author"]
	@bookPublisher = params["publisher"]
	@publication_year = params["publication_year"].to_i
	@publication_month = params["publication_month"].to_i
	@publication_date = params["publication_date"].to_i

	if (@isbn || @title)
		sql = <<-SQL
	  		INSERT INTO BookInformation(isbn,title,author,publisher,publication_year,publication_month,publication_date)
	  		VALUES("#{@isbn}","#{@title}","#{@author}","#{@publisher}","#{@publication_year}","#{@publication_month}","#{@publication_date}");
		SQL
		@db.execute(sql)
		redirect '/browse/@isbn'
	else
		redirect '/registration'
	end

end

#アプリケーション紹介ページ
get '/about' do
	erb :about ,layout: :layout
end