import 'package:flutter/material.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/ui/shared/combo_grid.dart';
import 'package:store_demo/ui/shared/product_grid.dart';
import 'package:store_demo/ui/shared/search_field.dart';
import 'package:store_demo/ui/views/my_basket_screen.dart';
import 'package:store_demo/ui/views/product_detail_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> temporaryProducts = [
      Product(
        id: 1,
        productName: 'Quinoa Fruit Salad',
        price: 2000,
        description:
            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
        category: 'nil',
        productImage: 'assets/images/quinoa-and-red.png',
      ),
      Product(
        id: 1,
        productName: 'Berry Mango Combo',
        price: 2000,
        description: 'Berry Quinoa, mango, Honey, Blueberries, Strawberries.',
        category: 'nil',
        productImage: 'assets/images/Honey-Lime-Peach.png',
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 35, bottom: 6),
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyBasketScreen()));
                        },
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
                  itemCount: temporaryProducts.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      for (var prod in temporaryProducts) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: prod),
                        ));
                      }
                    },
                    child: ComboGrid(
                      product: temporaryProducts[index],
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
                  itemCount: temporaryProducts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      for (var prod in temporaryProducts) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: prod),
                        ));
                      }
                    },
                    child: ProductGrid(
                      product: temporaryProducts[index],
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
