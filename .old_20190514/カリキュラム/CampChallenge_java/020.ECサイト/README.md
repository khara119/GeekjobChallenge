# 動作確認環境

サーバ側の動作に関してはどのブラウザでも問題ないはず。

フロント側のレイアウト等に関してはChromeしか確認してません。

# DB作成手順

1. `mysql -h localhost -u root`でルート権限でmysqlにログインする
1. `create database [DBNAME];`でデータベースを作成する
1. `grant all on [DBNAME].* to '[USERNAME]'@'localhost';`でユーザに権限を付与する
1. `exit`でmysqlからログアウトし、権限を付与したユーザでログインし直す
1. `use [DBNAME]`で使用するデータベースに移動する
1. `create table user_t(userID int primary key auto_increment, name varchar(255), password varchar(255), mail varchar(255), address text, total int, newDate datetime, deleteFlg int default 0);`でuser\_tテーブルを作成する
1. `create table buy_t(buyID int primary key auto_increment, userID int, itemCode varchar(255), type int, buyDate datetime, foreign key(userID) references user_t(userID));`でbuy\_tテーブルを作成する
