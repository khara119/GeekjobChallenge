public class Main {
  public static void main(String[] args) {
    CreateClass cc1 = new CreateClass();
    CreateClass cc2 = new CreateClass("MIL050", "高瀬蓮");
    CreateClass cc3 = new CreateClass();
    cc3.setFields("MIL500", "黒羽司");

    cc1.printFields();
    cc2.printFields();
    cc3.printFields();
  }
}
