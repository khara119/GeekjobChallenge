package camp.trial02;

public class Level22 {

	public static void main(String[] args) {
		/*
		 * int型の変数heightに身長の値を、int型の変数weightに体重の値を任意で入れてください
		 * BMIの値に応じて「痩せすぎ！」や「太り過ぎ！」など表示するように条件分岐させてください。
		 */
		
		double height = 1.7;
		double weight = 50;
		// weight = 70;
		// weight = 90;
		
		double bmi = weight / (height * height);
		if (bmi < 18.5) {
			System.out.println("やせすぎ！");
		} else if (bmi < 25) {
			System.out.println("もんだいなし！");
		} else {
			System.out.println("ふとりすぎ！");
		}
	}

}
