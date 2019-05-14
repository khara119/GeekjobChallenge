public class Class2 extends Class1 {
  public void clearProfile() {
    setField(null, 0, null);

    // Class1のフィールドがprivate以外なら以下でも可
    // this.name = null;
    // this.age = 0;
    // this.address = null;
  }
}
