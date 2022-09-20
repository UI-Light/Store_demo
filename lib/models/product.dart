class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> products = json.map((i) => Product.fromJson(i)).toList();
    return ProductList(products: products);
  }
}

class Product {
  final int id;
  final String productName;
  final double price;
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      productName: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      category: json["category"],
      productImage: json["image"],
    );
  }
}
