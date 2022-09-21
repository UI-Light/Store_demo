import 'package:store_demo/models/basket_item.dart';

class Basket {
  late Map<String, BasketItem> items;

  addItemToBasket(
      {required int id, required double price, required String product}) {
    if (items.containsKey(id)) {
      items.update(
          id.toString(),
          (existingBasketItem) => BasketItem(
              id: existingBasketItem.id,
              item: existingBasketItem.item,
              quantity: existingBasketItem.quantity + 1,
              price: existingBasketItem.price));
    } else {
      items.putIfAbsent(
        id.toString(),
        () => BasketItem(
          id: DateTime.now().toString(),
          item: product,
          quantity: 1,
          price: price,
        ),
      );
    }
  }

  double totalAmount() {
    var total = 0.0;
    items.forEach((key, basketItem) {
      total += basketItem.price * basketItem.quantity;
    });
    return total;
  }
}
