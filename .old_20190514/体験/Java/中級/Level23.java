package camp.trial02;

public class Level23 {

	public static void main(String[] args) {
		/*
		 * int型の変数moneyに好きな金額を入れてください。
		 *
		 * また、以下の条件分岐を作成して下さい。
		 * moneyの値が150以上のとき「ペットボトルを買いました」
		 * moneyの値が150未満かつ120以上のとき「缶を買いました」
		 * それ以外のときは「何も買えませんでした」
		 * と表示されるようにしてください。
		 *
		 * また、購入時にmoneyの残金と、購入したものがまだどれくらい購入できるかを表示しましょう。
		 *
		 */

		int money = 1000;
		// money = 150;
		// money = 120;
		// money = 110;
		
		if (money >= 150) {
			System.out.println("ペットボトルを買いました");
		} else if (money >= 120) {
			System.out.println("缶を買いました");
		} else {
			System.out.println("何も買えませんでした");
		}

		if (money >= 150) {
			System.out.println("残金：" + (money - 150));
			System.out.println("ペットボトルはあと" + (money/150 -1) + "個購入できます");
		}

	}

}
