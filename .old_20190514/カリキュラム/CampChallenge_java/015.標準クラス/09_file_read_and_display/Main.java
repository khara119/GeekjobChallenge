import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;

public class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(new File("../09_file_write_and_save/output.txt")));
		String line = "";
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}

		br.close();
	}
}
