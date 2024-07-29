import 'Product.dart';
import 'dart:io';

class ProductManager {
  List<Product> products = [];

  void addProduct() {
    print("Name: ");
    String? name = stdin.readLineSync();
    print("Description: ");
    String? description = stdin.readLineSync();
    print("Price: ");
    String? price = stdin.readLineSync();
    double? _price = double.tryParse(price ?? '0');
    if (name != null && description != null && _price != null) {
      Product product = Product(name, description, _price);
      products.add(product);
    } else {
      print(
          "Invalid Data! please enter valid name, description and price for your product");
    }
  }

  void viewAll() {
    if (products.isEmpty) {
      print("No products available.");
    } else {
      int num = 1;
      for (int i = 0; i < products.length; i++) {
        print("\nProduct $num");

        print("\tName: ${products[i].getName()}");
        print("\tDescription: ${products[i].getDescription()}");
        print("\tPrice: ${products[i].getPrice()}");
        num++;
      }
    }
  }

  void viewSingle() {
    if (products.isEmpty) {
      print("No products available.");
    } else {
      int num = 1;
      for (int i = 0; i < products.length; i++) {
        print("\t ${num}. ${products[i].name}");
        num++;
      }
      print("\n Choose the product id to see its detail:");
      String? _choice = stdin.readLineSync();
      int? choice = int.tryParse(_choice ?? '0');

      if (choice != null && choice > 0 && choice <= products.length) {
        choice--;
        print("\nHere are the details of the product:");
        print("\tName: ${products[choice].getName()}");
        print("\tDescription: ${products[choice].getDescription()}");
        print("\tPrice: ${products[choice].getPrice()}");
      } else {
        print("Invalid choice. Please select a valid product number.");
      }
    }
  }

  void editProduct() {
    if (products.isNotEmpty) {
      int num = 1;
      for (int i = 0; i < products.length; i++) {
        print("\t$num. ${products[i].name}");
        num++;
      }
      print("\n Choose the product id to edit its detail:");
      String? _choice = stdin.readLineSync();
      int? choice = int.tryParse(_choice ?? '0');
      if (choice != null && choice > 0 && choice <= products.length) {
        choice--;
        print("Give me the new detail....");
        print("Name: ");
        String? name = stdin.readLineSync();
        products[choice].setName(name!);
        print("Description: ");
        String? description = stdin.readLineSync();
        products[choice].setDescription(description!);
        print("Price: ");
        String? price = stdin.readLineSync();
        double? _price = double.tryParse(price ?? '0');
        products[choice].setPrice(_price!);
      } else {
        print("Invalid choice. Please select a valid product number.");
      }
    } else {
      print("Your doesn't have any product add some product...!");
    }
  }

  void deleteProduct() {
    if (products.isEmpty) {
      print("No products available.");
    } else {
      int num = 1;
      for (int i = 0; i < products.length; i++) {
        print("\t$num. ${products[i].name}");
        num++;
      }
      print("\n Choose the product id to delete from list :");
      String? _choice = stdin.readLineSync();
      int? choice = int.tryParse(_choice ?? '0');
      if (choice != null && choice > 0 && choice <= products.length) {
        choice--;
        products.removeAt(choice);
      } else {
        print("Ivalid choice. Please select a valid produt number.");
      }
    }
  }
}
