public class Main {
	public static void main(String[] args) {
		String email = "kohei.hara@mil.movie";
		int index = email.indexOf("@");
		// ※@を含めないなら-1する
		System.out.println(email.length() - index);

		/* 別解
		String[] split = email.split("@");
		// ※@を含めないなら+1を消す
		System.out.println(split[1].length() + 1);
		*/
	}
}
