public class Main {
  public static void main(String[] args) {
    ChildClass cc1 = new ChildClass();
    ChildClass cc2 = new ChildClass("MIL050", "高瀬蓮");
    ChildClass cc3 = new ChildClass();
    cc3.setFields("MIL500", "黒羽司");

    cc1.printFields();
    cc2.printFields();
    cc3.printFields();

    cc1.clearFields();
    cc2.clearFields();
    cc3.clearFields();

    cc1.printFields();
    cc2.printFields();
    cc3.printFields();
  }
}
