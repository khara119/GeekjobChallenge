public class ChildClass extends CreateClass {

  public ChildClass() {
    super();
  }

  public ChildClass(String id, String name) {
    super(id, name);
  }

  public void clearFields() {
    super.setFields(null, null);
  }
}
