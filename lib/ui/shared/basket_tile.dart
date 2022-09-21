import 'package:flutter/material.dart';

class BasketTile extends StatefulWidget {
  final String id;
  final double price;
  final int quantity;
  final String productName;
  const BasketTile(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.productName})
      : super(key: key);

  @override
  State<BasketTile> createState() => _BasketTileState();
}

class _BasketTileState extends State<BasketTile> {
  // Basket basket = Basket();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 6,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xffFFF2E7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.network('assets/images/breakfast-quinoa.png'),
      ),
      title: Text(
        widget.productName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),

        //textAlign: TextAlign.left,
      ),
      subtitle: Row(
        children: [
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_circle_outline),
              color: const Color(0xff333333),
              iconSize: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.quantity.toString(),
            style: TextStyle(fontSize: 14, color: Color(0xff27214D)),
          ),
          const SizedBox(
            width: 12,
          ),

          //TODO: Fix icon Size
          Container(
            height: 24,
            width: 25,
            decoration: BoxDecoration(
              color: const Color(0xffFFF2E7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                ),
                color: Theme.of(context).primaryColor,
                iconSize: 12,
              ),
            ),
          ),
        ],
      ),
      trailing: Text(
        '\$${widget.price}'.toString(),
        style: TextStyle(fontSize: 16, color: Color(0xff27214D)),
      ),
    );
  }
}
