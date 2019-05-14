package camp.trial02;

public class Level32 {

	public static void main(String[] args) {
		for (int i=-5; i<=105; i++) {
			System.out.print(i + "：");
			testPointCheck(i);
		}

	}

	public static void testPointCheck(int num) {
		if (num < 0 || num > 100) {
			System.out.println(num + "点なんてありえません！");
		} else if (num == 100) {
			System.out.println("満点！");
		} else if (num >= 80) {
			System.out.println("すばらしい！");
		} else if (num >= 60) {
			System.out.println("なんとか合格");
		} else {
			System.out.println("不合格！");
		}
	}
}
