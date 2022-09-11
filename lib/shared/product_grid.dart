import 'package:flutter/material.dart';
import 'package:store_demo/ui/product_detail_screen.dart';

class ProductGrid extends StatefulWidget {
  final String productName;
  final String productImage;
  final String price;
  const ProductGrid({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.price,
  }) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(32, 32, 32, 0.05),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 0),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const ProductDetailScreen())));
                  },
                  child: Image.asset(widget.productImage))),
          Text(
            widget.productName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.price}',
                style: const TextStyle(fontSize: 14, color: Color(0xffF08626)),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 24,
                width: MediaQuery.of(context).size.width / 12,
                decoration: BoxDecoration(
                    color: const Color(0xffFFF2E7),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                    ),
                    color: Theme.of(context).primaryColor,
                    iconSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
