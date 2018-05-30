<?php
// 環境によって異なるので環境変数用のファイルを読み込み
// 通常は必要ないのでROOT_URLを自身の環境に合わせればおｋ
require_once '../config/define.php';

const ROOT_URL = 'http://localhost/' . ROOT_DIR . '/app';     //indexディレクトリへのURL
const TOP_URI = '/';                                //トップページ
const INSERT = 'insert.php';                   //登録ページ
const INSERT_CONFIRM = 'insert_confirm.php';   //登録確認ページ
const INSERT_RESULT = 'insert_result.php';     //登録完了ページ
const SEARCH = 'search.php';                   //検索ページ

// 種別変換用の変数
const TYPE = array(
	'エンジニア',
	'営業',
	'その他'
);
