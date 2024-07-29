import 'dart:io';
import 'ProductManager.dart';

void main() {
  ProductManager productManager = ProductManager();

  print("\n\n------------Wellcome to Boss!-------------\n\n");
  bool run = true;
  while (run) {
    print("\t 1. Add a new product");
    print("\t 2. View all products");
    print("\t 3. View a single products");
    print("\t 4. Edit a product (update name, description, price)");
    print("\t 5. Delete a product");
    print("\t 0. Exit the progarm");
    print("What do you want to do?");

    String? choice = stdin.readLineSync();
    int? _choice = int.tryParse(choice ?? '0');
    switch (_choice) {
      case 1:
        int prevLength = productManager.products.length;
        productManager.addProduct();
        if (prevLength != productManager.products.length) {
          print("The product added successfully!!");
        } else {
          print("Failed to Add the product.");
        }
        break;
      case 2:
        productManager.viewAll();
        break;
      case 3:
        productManager.viewSingle();
        break;
      case 4:
        productManager.editProduct();
        break;
      case 5:
        productManager.deleteProduct();
      case 0:
        print("Thank you for checking me. it was fun!");
        run = false;
      default:
        print("chose from the availabele options");
    }

    if (run == true) {
      print("\n Do you want to coutinue(y/n)");
      String? next_choice = stdin.readLineSync();
      if (next_choice == "n" || next_choice == "N") {
        run = false;
      }
    }
  }
}
