import 'package:flutter/material.dart';
import 'package:store_demo/models/products_in_cart.dart';

class BasketTile extends StatefulWidget {
  final product;
  final void Function(int) deleteItem;
  const BasketTile({Key? key, required this.product, required this.deleteItem})
      : super(key: key);

  @override
  State<BasketTile> createState() => _BasketTileState();
}

class _BasketTileState extends State<BasketTile> {
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
        child: Image.network(widget.product["productImage"]!),
      ),
      title: Text(
        widget.product["productName"]!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),

        //textAlign: TextAlign.left,
      ),
      subtitle: Row(
        children: [
          Text(
            widget.product["quantity"]!.toString(),
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            onPressed: () {
              widget.deleteItem(widget.product["id"]!);
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      trailing: Text(
        '\$${widget.product["price"]}'.toString(),
        style: const TextStyle(fontSize: 16, color: Color(0xff27214D)),
      ),
    );
  }
}
