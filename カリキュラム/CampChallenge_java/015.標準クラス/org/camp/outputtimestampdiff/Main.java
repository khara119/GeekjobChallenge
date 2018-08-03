import java.util.Calendar;

public class Main {
	public static void main(String[] args) {
		Calendar calendar1 = Calendar.getInstance();
		calendar1.set(2015, 0, 1, 0, 0, 0);
		Calendar calendar2 = Calendar.getInstance();
		calendar2.set(2015, 11, 31, 23, 59, 59);

		System.out.println(calendar1.getTime());
		System.out.println(calendar2.getTime());

		System.out.println(calendar2.getTimeInMillis() - calendar1.getTimeInMillis());
	}
}
