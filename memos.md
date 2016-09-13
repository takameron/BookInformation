# 「本評価共有アプリ」のメモ

## 使う技術
* sinatra
* bootstrap
* sqlite(データベース)

## 画面
* メインページ
* 閲覧ページ
* 登録ページ
* アプリの解説ページ
* エラー(Not Found/404)ページ

## データベース
* データベース名   :   BookInformation.db
* テーブル名 :   BookData
    * フィールド
        * id(登録順)
        * isbn(ISBN番号)
        * title(書名)
        * author(著者)
        * publisher(出版社)
        * publication_year(出版年)
        * publication_month(出版月)
        * publication_dates(出版日)
        * views(閲覧数)
* テーブル名 :   BookReputation
    * フィールド
        * id(登録順)
        * dataid(BookDataの対応するid)
        * stars(5段階評価(1~5))
        * Reputation(評判)