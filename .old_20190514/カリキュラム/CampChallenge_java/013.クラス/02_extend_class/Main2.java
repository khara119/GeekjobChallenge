public class Main1 {
  public static void main(String[] args) {
    Class2 class2 = new Class2();
    class2.printProfile();
    class2.setProfile("原昂平", 26, "東京都");
    class2.printProfile();
    class2.clearProfile();
    class2.printProfile();
  }
}
