public class Main {
	public static void main(String[] args) {
		String text = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
		text = text.replace("I", "い");
		text = text.replace("U", "う");
		System.out.println(text);
	}
}
