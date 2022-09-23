// ignore_for_file: unused_import, unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_demo/data/http_service.dart';
import 'package:store_demo/models/cart.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/models/product_info.dart';
import 'package:store_demo/models/products_in_cart.dart';
import 'package:store_demo/ui/shared/basket_tile.dart';
import 'package:store_demo/ui/shared/checkout_bottom_sheet.dart';
import 'package:store_demo/ui/views/my_basket_screen.dart';

class MyBasketScreen extends StatefulWidget {
  const MyBasketScreen({Key? key}) : super(key: key);

  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {
  List<dynamic> products = [];
  HttpService httpService = HttpService();
  double totalPrice = 0;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void showBasketItems() async {
    String? prod = await storage.read(key: 'cartProducts');
    print('prodb==$prod');
    products = jsonDecode(prod!);
    setState(() {});

    print('BasketPageproducts =$products');
  }

  void deleteBasketItem(int id) async {
    products.removeWhere((element) => element["id"] == id);
    storage.write(key: 'cartProducts', value: jsonEncode(products));
    print('cart after deletion $products');
    setState(() {});
  }

  void getTotalPrice() async {
    await storage.read(key: 'cartProducts');
    products.forEach((element) {
      setState(() {
        totalPrice += element["price"];
      });
    });
    print(totalPrice);
  }

  @override
  void initState() {
    showBasketItems();
    getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: const [
                        Icon(Icons.arrow_back),
                        Text(
                          'Go back',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'My Basket',
                    style: const TextStyle(
                      fontSize: 24,
                      color: const Color(0xffFFFFFF),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => BasketTile(
                      product: products[index],
                      deleteItem: deleteBasketItem,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        totalPrice.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return CheckoutBottomSheet(
                              totalAmount: totalPrice.toInt(),
                            );
                          });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
