package camp.trial01;

public class Level13 {
	public static void main(String[] args) {
		/*
		 * 【課題13】
		 *int型の変数ageに自分の年齢を入れ、20歳以上であれば「お酒が飲めます！」、
		 *そうでなければ「まだお酒は飲めません！」と表示するようにして下さい。
		 */
		//ここから
		int age = 26;
		// age = 19; // ← 20未満の結果確認用

		if(age >= 20) {
			System.out.println("お酒が飲めます！");
		} else {
			System.out.println("まだお酒は飲めません！");
		}

		//ここまで

	}
}
