package camp.trial02;

public class Level30 {

	public static void main(String[] args) {
		/*
		 * 配列を基に、「GEEKJOB」と表示させて下さい
		 *
		 */
		String[] message = {"P","G",
                "R","E",
                "O","E",
                "G","K",
                "R","J",
                "A","O",
                "M","B"};

		for (int i=1; i<message.length; i+=2) {
			System.out.print(message[i]);
		}
		
		/** 別解 **/
		/**
		for (int i=0; i<message.length; i++) {
			if (i%2 == 1) {
				System.out.print(message[i]);
			}
		}
		**/
	}
}
