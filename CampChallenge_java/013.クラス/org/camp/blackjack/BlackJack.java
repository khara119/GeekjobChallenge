public class BlackJack {
  public static void main(String[] args) {
    User user = new User();
    Dealer dealer = new Dealer();

    user.setCard(dealer.deal());
    dealer.setCard(dealer.deal());

    while(true) {
      boolean flag = true;

      if (user.checkSum()) {
        flag = false;

        user.setCard(dealer.hit());
      }

      if (dealer.checkSum()) {
        flag = false;

        dealer.setCard(dealer.hit());
      }

      if (flag) {
        break;
      }
    }

    int user_total = user.open();
    int dealer_total = dealer.open();

    System.out.println("User " + user_total + " : " + dealer_total + " Dealer");

    if (user_total > 21) {
      user_total = -1;
    }

    if (dealer_total > 21) {
      dealer_total = -1;
    }

    if (user_total < dealer_total) {
      System.out.println("User LOSE");
    } else if (user_total > dealer_total) {
      System.out.println("User WIN");
    } else {
      System.out.println("DRAW");
    }
  }
}
