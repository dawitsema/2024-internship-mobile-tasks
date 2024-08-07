class Product {
  final String id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  // Example method to apply a discount to the product price
  // double applyDiscount(double discountPercentage) {
  //   if (discountPercentage < 0 || discountPercentage > 100) {
  //     throw ArgumentError("Invalid discount percentage");
  //   }
  //   return price * (1 - discountPercentage / 100);
  // }

  // Other business logic methods can be added here
}
