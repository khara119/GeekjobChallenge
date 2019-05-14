<?php
// 環境によって異なるので環境変数用のファイルを読み込み
// 通常は必要ないのでROOT_URLを自身の環境に合わせればおｋ
require_once '../config/define.php';

//DBへの接続用を行う。成功ならPDOオブジェクトを、失敗なら中断、メッセージの表示を行う
function connect2MySQL(){
    try{
        $pdo = new PDO('mysql:host=localhost;dbname=' . DB_NAME . ';charset=utf8;', DB_USER_NAME, DB_USER_PASS);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
    	// $e->getMessage()が文字化け起こしたのでUTF-8にエンコードして出力
        die('接続に失敗しました。次記のエラーにより処理を中断します:<br>'.mb_convert_encoding($e->getMessage(), 'UTF-8', 'ASCII,JIS,UTF-8,CP51932,SJIS-win'));
    }
}

/**
 * DBにレコードを登録する。
 *
 * @param Object data 各カラムのデータが入った連想配列
 * @return String 登録成功なら空文字、失敗ならエラー情報を返す（接続関数で失敗した時はそのまま）
 */
function insertRecord2MySQL($data) {
	try {
		$pdo = connect2MySQL();

	    //DBに全項目のある1レコードを登録するSQL
	    $insert_sql = "INSERT INTO user_t(name,birthday,tell,type,comment,newDate)"
	            . "VALUES(:name,:birthday,:tell,:type,:comment,:newDate)";

	    /* 以下はわざとSQLエラーを起こすためのもの（課題8用） */
	    // $insert_sql = "INSERT INTO user_t(name,birthday,tell,type,comment,newDate)". "VALUES(:name,:birthday,:tell,:type,:comment,:newDate)";


	    //クエリとして用意
	    $insert_query = $pdo->prepare($insert_sql);

	    //SQL文にセッションから受け取った値＆現在時をバインド
	    $insert_query->bindValue(':name',$data['name']);
	    $insert_query->bindValue(':birthday',$data['birthday']);
	    $insert_query->bindValue(':tell',$data['tell']);
	    $insert_query->bindValue(':type',$data['type']);
	    $insert_query->bindValue(':comment',$data['comment']);

	    // 現在時間をdatetime形式に変換
	    $datetime = new Datetime('@' . time());
	    // デフォルトでは日本時間にならないのでタイムゾーンを日本にセットする
	    $datetime->setTimezone(new DateTimeZone('Asia/Tokyo'));
	    $datetime_format = $datetime->format('Y-m-d H:i:s');

	    $insert_query->bindValue(':newDate',$datetime_format);
	    
	    //SQLを実行
	    $insert_query->execute();
	    
	    //接続オブジェクトを初期化することでDB接続を切断
	    $pdo=null;

	    return '';
	} catch(PDOException $e) {
		return '次記のエラーにより処理を中断します<br>'.mb_convert_encoding($e->getMessage(), 'UTF-8', 'ASCII,JIS,UTF-8,CP51932,SJIS-win');
	}
}