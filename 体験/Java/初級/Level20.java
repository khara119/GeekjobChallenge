package camp.trial01;

public class Level20 {
	public static void main(String[] args) {
		/*
		 * 【課題20】
		 *  FizzBuzzの作成！
		 */
		//ここから

		for (int i=1; i<=40; i++) {
			System.out.print(i);
			if (i%3 == 0) {
				System.out.print("Fizz");
			}
			if (i%5 == 0) {
				System.out.print("Buzz");
			}
			
			System.out.println();
		}


		//ここまで
	}
}
