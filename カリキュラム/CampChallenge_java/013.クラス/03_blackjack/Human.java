import java.util.ArrayList;

abstract class Human {
  protected ArrayList<Integer> myCards;

  public Human() {
    myCards = new ArrayList<>();
  }

  abstract public int open();
  abstract public void setCard(ArrayList<Integer> cards);
  abstract public boolean checkSum();

  public boolean isBlackjack() {
    return this.myCards.size() == 2 && this.open() == 21;
  }
}
  
