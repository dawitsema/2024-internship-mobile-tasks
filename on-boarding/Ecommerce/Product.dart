class Product {
  String? name;
  String? description;
  double? price;

  Product(String name, String description, double price) {
    this.name = name;
    this.description = description;
    this.price = price;
  }

  void showProduct() {
    print("Description of the Product:\n");
    print("Name: $name");
    print("Description: $description");
    print("Price: $price");
  }

  void setName(String name) {
    this.name = name;
  }

  String? getName() {
    return name;
  }

  void setDescription(String description) {
    this.description = description;
  }

  String? getDescription() {
    return description;
  }

  void setPrice(double price) {
    this.price = price;
  }

  double? getPrice() {
    return price;
  }
}
