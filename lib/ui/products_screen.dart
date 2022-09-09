import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/mybasket.png',
                      ),
                      Text('My basket'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
