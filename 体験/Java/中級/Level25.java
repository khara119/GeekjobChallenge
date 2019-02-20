package camp.trial02;

public class Level25 {

	public static void main(String[] args) {
		/*
		 * forを用いて、1番目から50番目までの三角数を表示させよう
		 */

		int n = 0;
		for (int i=1; i<=50; i++) {
			n += i;
			System.out.println(n);
		}
	}

}
