import java.util.ArrayList;
import java.util.Random;
public class Dealer extends Human {
  protected ArrayList<Integer> cards;

  public Dealer() {
    cards = new ArrayList<>();

    for (int i=1; i<=4; i++) {
      for (int j=1; j<=13; j++) {
        cards.add(j);
      }
    }

    //System.out.println(cards.toString());
  }

  public int open() {
    int sum = 0;
    for (int card : myCards) {
      sum += card;
    }

    return sum;
  }

  public void setCard(ArrayList<Integer> cards) {
    System.out.println("Dealer get cards: " + cards.toString());
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

  public ArrayList<Integer> deal() {
    Random random = new Random();
    ArrayList<Integer> selectedCards = new ArrayList<>();

    for (int i=1; i<=2; i++) {
      int card = cards.remove(random.nextInt(cards.size()));
      selectedCards.add(card);
    }

    //System.out.println(cards.toString());

    return selectedCards;
  }

  public ArrayList<Integer> hit() {
    Random random = new Random();
    ArrayList<Integer> selectedCards = new ArrayList<>();

    int card = cards.remove(random.nextInt(cards.size()));
    selectedCards.add(card);

    //System.out.println(cards.toString());

    return selectedCards;
  }
}
