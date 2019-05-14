
package camp.trial02;

public class Level34 {

	public static void main(String[] args) {
		createSquare(5,3);
	}

	public static void createSquare(int height , int width) {
		for (int i=1; i<=height; i++) {
			for (int j=1; j<=width; j++) {
				System.out.print("□");
			}
			System.out.println();
		}
	}
}
