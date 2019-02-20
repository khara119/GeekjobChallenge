package camp.trial02;

public class Level28 {

	public static void main(String[] args) {
		/*
		 * 配列の要素全ての合計値と、その平均値を表示して下さい。
		 */

		int[] point = {10,25,35,40,55};
		
		int total = 0;
		for (int p : point) {
			total += p;
		}
		
		/** 別解 **/
		/*
		total = 0;
		for (int i=0; i<point.length; i++) {
			total += point[i];
		}
		*/
		
		System.out.println("合計：" + total);
		System.out.println("平均：" + (total / point.length));
	}

}
