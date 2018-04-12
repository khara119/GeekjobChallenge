import java.util.Date;
import java.text.SimpleDateFormat;

public class Main {
	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年M月d日 H時m分s秒");
		System.out.println(sdf.format(date));
	}
}
