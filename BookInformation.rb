require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

#データベースの準備
before do
	@db = SQLite3::Database.new("BookInformation.db")
end
after do
	@db.close
end

#メインページ
get '/' do
	erb :index ,layout: :layout
end

#閲覧ページ
get '/browse/:ISBN/:ID' do
	@ISBN = params["ISBN"].to_i
	@ID = params["ID"].to_i

	#IDが指定されていなかった場合に、入力されたISBNが結び付けられている中で最後のIDを指定
	if(!@ID)
		sql = <<-SQL
			SELECT id FROM BookData WHERE isbn = "#{@ISBN}"
		SQL
		data = @db.execute(sql)
		if (data.empty?)
			redirect '/'
		end
		@ID = data[data.length-1]
	end

	#IDに結びついているISBNが入力されたISBNと等しいか確認
	sql = <<-SQL
		SELECT isbn FROM BookData WHERE id = "#{@ID}"
	SQL
	data = @db.get_first_value(sql)
	if(data!=@ISBN)
		redirect '/about'
	end

	#閲覧数更新
	sql = <<-SQL
		SELECT views FROM BookData WHERE id = "#{@ID}"
	SQL
	data = @db.get_first_value(sql)
	data = data + 1

	sql = <<-SQL
		UPDATE BookData SET views = "#{data}" WHERE id = "#{@ID}"
	SQL
	@db.execute(sql)

	#閲覧する対象のデータを取得
	sql = <<-SQL
		SELECT * FROM BookData WHERE id = "#{@ID}"
	SQL
	#id,isbnは取得済み
	#それぞれのデータは@deta配列の[0]の中の配列として入っている
	#配列の添字は0から始まる
	@data = @db.execute(sql)
	@title = @data[0][2]
	@author = @data[0][3]
	@publisher = @data[0][4]
	@publication_year = @data[0][5]
	@publication_month = @data[0][6]
	@publication_dates = @data[0][7]
	@views = @data[0][8]

	#閲覧ページに移動
	erb :browse ,layout: :layout
end

#登録ページ
get '/registration' do
	erb :registration ,layout: :layout
end

#登録作業
get '/registration/insert' do
	@isbn = params["isbn"].to_i
	@title = params["title"]
	@author = params["author"]
	@publisher = params["publisher"]
	@publication_year = params["publication_year"].to_i
	@publication_month = params["publication_month"].to_i
	@publication_date = params["publication_date"].to_i

	if (@isbn && @title)
		sql = <<-SQL
	  		INSERT INTO BookData(isbn,title,author,publisher,publication_year,publication_month,publication_date)
	  		VALUES("#{@isbn}","#{@title}","#{@author}","#{@publisher}","#{@publication_year}","#{@publication_month}","#{@publication_date}");
		SQL
		@db.execute(sql)

		#idの取得
		sql = <<-SQL
			SELECT id FROM BookData WHERE ROWID = last_insert_rowid();
		SQL
		@id = @db.get_first_value(sql);
		redirect '/browse/"#{@isbn}"/"#{@id}"'
	else
		redirect '/registration'
	end
end

#アプリケーション紹介ページ
get '/about' do
	erb :about ,layout: :layout
end