package camp.trial01;

public class Level14 {
	public static void main(String[] args) {
		/*
		 * 【課題14】
		 * 自動販売機のシステムプログラムです。
		 * int型の変数moneyに好きな金額を入れてください。
		 *
		 */
		int money = 150;    //好きな数に変更して下さい
		// money = 120;
		// money = 110;

	    /*
	        以下のifを作成して下さい
	        moneyの値が150以上のとき「ペットボトルを買いました」
	        moneyの値が120以上150未満のとき「缶を買いました」
	        moneyの値が120未満のとき「何も買えませんでした」
	    */
		//ここから
		if(money >= 150) {
			System.out.println("ペットボトルを買いました");
		} else if(money >= 120){
			System.out.println("缶を買いました");
		} else {
			System.out.println("何も買えませんでした");
		}


		//ここまで
	}
}
