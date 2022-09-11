import 'package:flutter/material.dart';
import 'package:store_demo/ui/my_basket_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
                child: Image.asset(
                  'assets/images/breakfast-quinoa.png',
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
                        const Text(
                          'Quinoa Fruit Salad',
                          style: TextStyle(
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
                                onPressed: () {},
                                icon: const Icon(Icons.remove_circle_outline),
                                color: const Color(0xff333333),
                                iconSize: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              '1',
                              style: TextStyle(
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
                                  onPressed: () {},
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
                            const Text(
                              '\$2,000',
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xff27214D)),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 15),
                        const Text(
                          'One Pack Contains:',
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
                        const Text(
                          'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Divider(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff000000),
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
                                    icon: const Icon(
                                      Icons.favorite_border,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    iconSize: 24,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyBasketScreen(),
                                    ),
                                  );
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
