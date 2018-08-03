import java.text.SimpleDateFormat;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.File;
import java.util.StringTokenizer;
import java.util.Date;

public class Main {
	public static void main(String[] args) throws Exception {
		FileWriter fw = new FileWriter(new File("log.txt"), true);
		fw.write("単語切り出し\n");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		fw.write("=====処理開始（" + sdf.format(new Date()) + "）=====\n");

		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(new File("Main.java")), "UTF-8"));
		String program = "";
		String line = "";
		while ((line = br.readLine()) != null) {
			program += line + "\n";
		}

		br.close();

		StringTokenizer st = new StringTokenizer(program);
		while (st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}

		fw.write("=====処理終了（" + sdf.format(new Date()) + "）=====\n\n");
		fw.close();
	}
}
