package camp.trial02;

public class Level29 {

	public static void main(String[] args) {
		/*
		 * 配列の要素の最大値と最低値を表示して下さい
		 */

		int[] point = {10,25,35,40,55};

		int max = point[0];
		int min = point[0];
		
		for (int i=1; i<point.length; i++) {
			if (max < point[i]) {
				max = point[i];
			}
			
			if (min > point[i]) {
				min = point[i];
			}
		}
		
		System.out.println("最大値：" + max);
		System.out.println("最小値：" + min);

	}

}
