package camp.trial02;

public class Level27 {

	public static void main(String[] args) {
		/*
		 * 配列の要素を全て表示させてください。
		 */

		String[] names = {"はばの","いとう","すぎやま","いまやなぎた","うちだ","はせがわ"};

		for (String name : names) {
			System.out.println(name);
		}
		
		/** 別解 **/
		/*
		for (int i=0; i<names.length; i++) {
			System.out.println(names[i]);
		}
		*/
	}

}
