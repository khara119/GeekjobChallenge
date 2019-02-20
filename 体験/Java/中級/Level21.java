package camp.trial02;

public class Level21 {

	public static void main(String[] args) {
		/*
		 * 文字列に対して、決まった文字列を返してみましょう。
		 * 文字列型変数を一つ用意し、if文を使って条件分けをしましょう。
		 */

		String call = "今日の天気は？";
		// call = "今日は何曜日？";
		// call = "Hey,Siri!";
		// call = "hoge";
		
		if (call.equals("今日の天気は？")) {
			System.out.println("晴れると良いですね");
		} else if (call.equals("今日は何曜日？")) {
			System.out.println("日曜日だと嬉しいです");
		} else if (call.equals("Hey,Siri!")) {
			System.out.println("そこまで高性能ではありません");
		} else {
			System.out.println("想定されていません");
		}

	}

}
