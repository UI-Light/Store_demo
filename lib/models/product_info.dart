class ProductInfo {
  final int productId;
  final int quantity;

  ProductInfo({required this.productId, required this.quantity});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      productId: json["productId"],
      quantity: json['quantity'],
    );
  }
}
