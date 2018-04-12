import java.util.Calendar;

public class Main {
	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(2016, 0, 1, 0, 0, 0);
		//System.out.println(calendar.getTime());
		System.out.println(calendar.getTimeInMillis());
	}
}
