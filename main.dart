
import 'dart:io';

void main() {
  const double smallPrice = 5.0;
  const double mediumPrice = 7.0;
  const double largePrice = 10.0;

  bool continueOrdering = true;

  print('===== PIZZA ORDER CALCULATOR =====');
  print('Small Pizza: \$5.00');
  print('Medium Pizza: \$7.00');
  print('Large Pizza: \$10.00');

  while (continueOrdering) {
    print('\nEnter pizza size (Small/Medium/Large):');
    String size = (stdin.readLineSync() ?? '').trim().toLowerCase();

    print('Enter quantity:');
    String quantityInput = (stdin.readLineSync() ?? '').trim();
    int? quantity = int.tryParse(quantityInput);

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity. Enter a positive number.');
    } else {
      double price = 0;

      switch (size) {
        case 'small':
          price = smallPrice;
          break;
        case 'medium':
          price = mediumPrice;
          break;
        case 'large':
          price = largePrice;
          break;
        default:
          print('Invalid pizza size. Please try again.');
      }

      if (price > 0) {
        double total = price * quantity;
        print('Pizza size: $size');
        print('Quantity: $quantity');
        print('Total payment: \$${total.toStringAsFixed(2)}');
      }
    }

    print('\nDo you want to order again? (yes/no):');
    String answer = (stdin.readLineSync() ?? '').trim().toLowerCase();

    while (answer != 'yes' && answer != 'no') {
      print('Please enter yes or no:');
      answer = (stdin.readLineSync() ?? '').trim().toLowerCase();
    }

    if (answer == 'no') {
      continueOrdering = false;
      print('Thank you for ordering!');
    }
  }
}
