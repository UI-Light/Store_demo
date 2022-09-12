import 'package:flutter/material.dart';
import 'package:store_demo/shared/combo_grid.dart';
import 'package:store_demo/shared/product_grid.dart';
import 'package:store_demo/shared/search_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 35, bottom: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/mybasket.png',
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ComboGrid(
                          productName: 'Honey lime combo',
                          productImage: 'assets/images/Honey-Lime-Peach.png',
                          price: '2,000'),
                      SizedBox(width: 8),
                      ComboGrid(
                          productName: 'Berry mango combo',
                          productImage: 'assets/images/Glowing-Berry.png',
                          price: '8,000'),
                    ],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ProductGrid(
                          productName: 'Quinoa fruit salad',
                          productImage: 'assets/images/quinoa-and-red.png',
                          price: '10,000'),
                      ProductGrid(
                          productName: 'Tropical fruit salad',
                          productImage:
                              'assets/images/Tropical-Fruit-Salad.png',
                          price: '10,000'),
                      ProductGrid(
                          productName: 'Quinoa fruit salad',
                          productImage: 'assets/images/quinoa-and-red.png',
                          price: '10,000'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
