package camp.trial01;

public class Level19 {
	public static void main(String[] args) {
		/*
		 * 【課題19】
		 * 条件分岐と組み合わせて、1から40を表示して、偶数のときだけ「偶数です！」と追加で表示しよう！
		 */
		//ここから

		for(int i=1; i<=40; i++) {
			System.out.print(i);
			if( i % 2 == 0) {
				System.out.print(" 偶数です！");
			}
			
			System.out.println();
		}


		//ここまで

	}
}
