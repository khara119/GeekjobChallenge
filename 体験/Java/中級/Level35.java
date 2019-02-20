package camp.trial02;

public class Level35 {

	public static void main(String[] args) {
		for (int i=1; i<=3; i++) {
			for (int j=1; j<=10; j++) {
				vendingMachine(1000, i, j);
			}
		}
	}
	
	public static void vendingMachine(int money, int drinkType, int num) {
		String name = "";
		int price = 0;
		
		if (drinkType == 1) {
			name = "コーラ";
			price = 150;
		} else if (drinkType == 2) {
			name = "お茶";
			price = 120;
		} else if (drinkType == 3) {
			name = "水";
			price = 100;
		} 
		
		int total = price * num;
		if (money < total) {
			System.out.println("料金が足りません");
		} else {
			System.out.println("商品名：" + name);
			System.out.println("個数：" + num);
			System.out.println("総額：" + total);
			System.out.println("残金：" + (money - total));
		}
	}

}
