import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:store_demo/data/http_service.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/models/products_in_cart.dart';
import 'package:store_demo/ui/views/my_basket_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Product> productInCart = [];

  FlutterSecureStorage storage = const FlutterSecureStorage();
  HttpService httpService = HttpService();

  bool _isFav = false;
  int _counter = 1;

  late int _price;
  double totalAmount = 0.0;

  bool get isFav => _isFav;
  int get counter => _counter;
  int get price => _price;

  void toggleIsFav() {
    setState(() {
      _isFav = !_isFav;
    });
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    if (_counter == 1) {
      setState(() {
        _counter = 1;
      });
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  void addToBasket(Product product) async {
    print('product:${widget.product.id}');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var result = await httpService.addToCart(
        dateFormat.format(DateTime.now()),
        [
          {"productId": widget.product.id, "quantity": counter}
        ].toString());

    print('result = $result');
    if (result == 'failed') {
      print('Could not add to cart');
    } else {
      String? prod = await storage.read(key: 'cartProducts');
      print('This is the product=$prod');

      if (jsonDecode(prod!).length == 0) {
        addProduct(product);
      } else {
        // List<ProductsInCart> latestCartProduct = [];
        print('prodb==$prod');
        List<dynamic> latestCartProduct = jsonDecode(prod!);
        print('This is a dynamicList $latestCartProduct');
        print('products =$latestCartProduct');
        latestCartProduct.forEach((element) async {
          if (element["id"] == product.id) {
            element["quantity"] = element["quantity"]! + 1;
            element["price"] = element["price"]! * element["quantity"]!;
            setState(() {});
            String json = jsonEncode(latestCartProduct);
            print('JSON= $json');
            await storage.write(key: "cartProducts", value: json);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MyBasketScreen(),
            ));
          } else {
            addProduct(product);
          }
        });
      }
    }
    setState(() {
      productInCart.add(product);
    });
  }

  void addProduct(Product product) async {
    String? prod = await storage.read(key: 'cartProducts');
    List<dynamic> latestCartProduct = jsonDecode(prod!);
    ProductsInCart products = ProductsInCart();
    products.price = product.price;
    products.productName = product.productName;
    products.productImage = product.productImage;
    products.category = product.category;
    products.quantity = counter;
    products.description = product.description;
    products.id = product.id;
    latestCartProduct.add(products);
    print('latest==$latestCartProduct');
    setState(() {});
    String json = jsonEncode(latestCartProduct);
    print('Encode json= $json');
    await storage.write(key: "cartProducts", value: json);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MyBasketScreen(),
    ));
  }
  // void changePrice(int productPrice) {
  //   if (_counter == 0 || _counter == 1) {
  //     setState(() {
  //       _price = productPrice;
  //     });
  //   } else {
  //     setState(() {
  //       _price = productPrice * _counter;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Image.network(
                  widget.product.productImage,
                  height: MediaQuery.of(context).size.height / 6,
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 18.0, left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.productName,
                          style: const TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Center(
                              child: IconButton(
                                onPressed: () {
                                  decrementCounter();
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                                color: const Color(0xff333333),
                                iconSize: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '$counter',
                              style: const TextStyle(
                                  fontSize: 24, color: Color(0xff27214D)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFF2E7),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    incrementCounter();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  iconSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 120,
                            ),
                            Text(
                              '\$${widget.product.price}',
                              style: const TextStyle(
                                  fontSize: 24, color: Color(0xff27214D)),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 15),
                        const Text(
                          'Product Description:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 2.0,
                          height: 20,
                          endIndent: MediaQuery.of(context).size.width / 2.2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          child: Text(
                            widget.product.description,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFF7F0),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: widget.product.isFavourite
                                        ? const Icon(Icons.favorite)
                                        : const Icon(
                                            Icons.favorite_border,
                                          ),
                                    color: Theme.of(context).primaryColor,
                                    iconSize: 24,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(widget.product.toString());
                                  addToBasket(
                                    widget.product,
                                  );

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MyBasketScreen(
                                  //       products: productInCart,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 14,
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Add to basket',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
