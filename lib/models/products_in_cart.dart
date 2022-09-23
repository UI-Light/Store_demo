import 'dart:convert';

ProductsInCart productsInCartFromJson(String str) =>
    ProductsInCart.fromJson(json.decode(str));

// String productsInCartToJson(ProductsInCart data) => json.encode(data.toJson());

class ProductsInCart {
  ProductsInCart({
    this.productName,
    this.price,
    this.description,
    this.category,
    this.productImage,
    this.quantity,
    this.isFavourite,
    this.id,
  });
  int? id;
  String? productName;
  double? price;
  String? description;
  String? category;
  String? productImage;
  int? quantity;
  bool? isFavourite;

  factory ProductsInCart.fromJson(Map<String, dynamic> json) => ProductsInCart(
        productName: json["productName"] == null ? null : json["productName"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        productImage:
            json["productImage"] == null ? null : json["productImage"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        isFavourite: json["isFavourite"] == null ? null : json["isFavourite"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName == null ? null : productName,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "productImage": productImage == null ? null : productImage,
        "quantity": quantity == null ? null : quantity,
        "isFavourite": isFavourite == null ? null : isFavourite,
        "id": id == null ? null : id,
      };
  ProductsInCart productsInCartFromJson(String str) =>
      ProductsInCart.fromJson(json.decode(str));

  String productsInCartToJson(ProductsInCart data) =>
      json.encode(data.toJson());
}
