import java.util.ArrayList;

public class User extends Human {
  public int open() {
    int sum = 0;
    for (int card : myCards) {
      sum += card;
    }

    return sum;
  }

  public void setCard(ArrayList<Integer> cards) {
    System.out.println("User get cards: " + cards.toString());
    myCards.addAll(cards);
  }

  public boolean checkSum() {
    int sum = 0;
    for (int card : myCards) {
      sum += card;
    }

    if (sum < 18) {
      return true;
    }

    return false;
  }
}
