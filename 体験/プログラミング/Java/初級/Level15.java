package camp.trial01;

public class Level15 {
	public static void main(String[] args) {
		/*
		 * 【課題15】
		 * int型の変数numを宣言して、適当な数値を入れましょう。
		 * その後、numの値が4の倍数であれば「4の倍数です！」と表示されるプログラムを作りましょう。
		 */
		//ここから

		int num = 16;
		// num = 17; // ← 4の倍数以外の確認用

		// 倍数は剰余算（余り）を利用する
		if(num%4 == 0) {
			System.out.println("4の倍数です！");
		}

		//ここまで

	}
}
