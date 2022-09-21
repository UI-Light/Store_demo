import 'package:flutter/material.dart';
import 'package:store_demo/data/http_service.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/ui/shared/combo_grid.dart';
import 'package:store_demo/ui/shared/product_grid.dart';
import 'package:store_demo/ui/shared/search_field.dart';
import 'package:store_demo/ui/views/my_basket_screen.dart';
import 'package:store_demo/ui/views/product_detail_screen.dart';
import 'dart:convert' show json, base64, utf8;

class ProductsScreen extends StatefulWidget {
  final String jwt;
  final Map? payload;

  const ProductsScreen({
    Key? key,
    required this.jwt,
    this.payload,
  }) : super(key: key);

  factory ProductsScreen.fromBase64(String jwt) {
    return ProductsScreen(
      jwt: jwt,
      payload: json.decode(
        utf8.decode(
          base64.decode(base64.normalize(jwt.split(".")[1])),
        ),
      ),
    );
  }

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];
  HttpService httpService = HttpService();
  bool isLoading = true;

  void loadProducts() async {
    var result = await httpService.fetchProducts();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() {
        products = result.products;
        isLoading = false;
      }),
    );
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xffFFA451)),
              ))
            : Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 35, bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu),
                        Column(
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) => MyBasketScreen(
                              //         voidCallback:
                              //         basket.addItemToBasket(
                              //                 id: widget.product.id,
                              //                 price: widget.product.price,
                              //                 product:
                              //                     widget.product.productName) ,
                              //       )));
                              // },
                              child: Image.asset(
                                'assets/images/mybasket.png',
                              ),
                            ),
                            const Text('My basket'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Text(
                          'Hello Tony, ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'What fruit salad ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'combo do you want today?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const SearchField(),
                    const SizedBox(height: 20),
                    const Text(
                      'Recommended Combo',
                      style: TextStyle(
                        fontSize: 24,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        // padding: const EdgeInsets.only(right: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: products[index],
                                ),
                              ),
                            );
                          },
                          child: ComboGrid(
                            product: products[index],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Hottest',
                            style: TextStyle(
                              color: Color(0xff27214D),
                              fontSize: 24,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Popular',
                            style: TextStyle(
                              color: Color(0xff938DB5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'New Combo',
                            style: TextStyle(
                              color: Color(0xff938DB5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Top',
                              style: TextStyle(
                                color: Color(0xff938DB5),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: products[index],
                                ),
                              ),
                            );
                          },
                          child: ProductGrid(
                            product: products[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
