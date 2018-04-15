import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;

public class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(new File("../filewritesave/output.txt")));
		String line = "";
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}

		br.close();
	}
}
