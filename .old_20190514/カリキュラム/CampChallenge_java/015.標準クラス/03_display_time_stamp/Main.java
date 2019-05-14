import java.util.Date;
import java.util.Calendar;
import java.text.SimpleDateFormat;

public class Main {
	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(2016, 10, 4, 10, 0, 0);
		Date date = calendar.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(date));
	}
}
