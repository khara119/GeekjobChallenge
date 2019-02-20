package camp.trial02;

public class Level26 {

	public static void main(String[] args) {
		/*
		 * 九九の表が表示されるプログラムを作成して下さい
		 */

		for (int i=1; i<=9; i++) {
			for (int j=1; j<=9; j++) {
				System.out.print(i*j + " ");
			}
			System.out.println();
		}
	}

}
