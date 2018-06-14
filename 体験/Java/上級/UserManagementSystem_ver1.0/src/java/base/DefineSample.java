/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package base;

/**
 * 実行環境によって異なるものを定義化したクラス。
 * 実際に使う場合はDefine.javaにリネームして、そちらを使う。
 *
 * @author hara
 */
public class DefineSample {
	// プロジェクトのルートパス
	// System.getProperty("user.dir")が環境によって使えないのでこれで代用。
    public static String PROJECT_PATH = "c:/Users/xxxx/Documents/NetBeansProjects/PROJECT_DIRECTORY/";
	// データベース名
    public static String DB_NAME = "DB_NAME";
	// データベースで使用するユーザ名
    public static String DB_USER_NAME = "USER_NAME";
	// データベースで使用するユーザのパスワード
    public static String DB_USER_PASSWORD = "PASSWORD";
}
