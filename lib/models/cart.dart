import 'package:store_demo/models/product_info.dart';

class CartList {
  final List<Cart> cartList;
  CartList({required this.cartList});
  factory CartList.fromJson(List<dynamic> json) {
    List<Cart> cartList = json.map((i) => Cart.fromJson(i)).toList();
    return CartList(cartList: cartList);
  }
}

class Cart {
  final int id;
  final int userId;
  final String date;
  final List<ProductInfo> productsInCart;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.productsInCart,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    var listC = json['products'] as List;

    List<ProductInfo> cartList =
        listC.map((i) => ProductInfo.fromJson(i)).toList();
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      productsInCart: cartList,
    );
  }
}

// class Basket {
//   late Map<String, BasketItem> items;

//   addItemToBasket(
//       {required int id, required double price, required String product}) {
//     if (items.containsKey(id)) {
//       items.update(
//           id.toString(),
//           (existingBasketItem) => BasketItem(
//               id: existingBasketItem.id,
//               item: existingBasketItem.item,
//               quantity: existingBasketItem.quantity + 1,
//               price: existingBasketItem.price));
//     } else {
//       items.putIfAbsent(
//         id.toString(),
//         () => BasketItem(
//           id: DateTime.now().toString(),
//           item: product,
//           quantity: 1,
//           price: price,
//         ),
//       );
//     }
//   }

//   double totalAmount() {
//     var total = 0.0;
//     items.forEach((key, basketItem) {
//       total += basketItem.price * basketItem.quantity;
//     });
//     return total;
//   }
// }
