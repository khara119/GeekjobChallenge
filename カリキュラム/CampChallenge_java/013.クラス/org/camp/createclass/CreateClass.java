public class CreateClass {
  private String id;
  private String name;

  public CreateClass() {
    id = "MIL005";
    name = "原昂平";
  }

  public CreateClass(String id, String name) {
    this.id = id;
    this.name = name;
  }

  public void setFields(String id, String name) {
    this.id = id;
    this.name = name;
  }

  public void printFields() {
    System.out.println("ID: " + this.id);
    System.out.println("Name: " + this.name);
  }
}
