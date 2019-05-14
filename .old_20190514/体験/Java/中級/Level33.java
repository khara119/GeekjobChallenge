package camp.trial02;

public class Level33 {

	public static void main(String[] args) {
		printFizzBuzz(50);
	}

	public static void printFizzBuzz(int count) {
		for (int i=1; i<=count; i++) {
			if (i%15 == 0) {
				System.out.println("FizzBuzz");
			} else if (i%3 == 0) {
				System.out.println("Fizz");
			} else if (i%5 == 0) {
				System.out.println("Buzz");
			} else {
				System.out.println(i);
			}
		}
	}

}
