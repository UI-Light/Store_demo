class Product {
  final int id;
  final String productName;
  final int price;
  final String description;
  final String category;
  final String productImage;
  bool isFavourite;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.description,
    required this.category,
    required this.productImage,
    this.isFavourite = false,
  });
}
