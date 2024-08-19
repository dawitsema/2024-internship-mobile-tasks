class Urls {
  static String getAllProducts() =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String getSpecificProduct(String id) =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  static String updateProduct(String id) =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

  static String deleteProduct(String id) =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  static String createProduct() =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String logIn() =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';
  static String signUp() =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
  static String getUser() =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/me';
}
