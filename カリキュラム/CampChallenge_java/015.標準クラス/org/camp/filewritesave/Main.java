import java.io.File;
import java.io.FileWriter;

public class Main {
	public static void main(String[] args) throws Exception {
		String introduction = "社会人1年目の原です。\n";
		introduction += "インタラクティブ動画編集プラットフォームMILを開発してます。";

		FileWriter fw = new FileWriter(new File("output.txt"));
		fw.write(introduction);
		fw.close();
	}
}
