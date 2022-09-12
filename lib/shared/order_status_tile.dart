import 'package:flutter/material.dart';

class OrderStatusTile extends StatefulWidget {
  final String image;
  final String status;
  final String? subtitle;
  const OrderStatusTile(
      {Key? key, required this.image, required this.status, this.subtitle})
      : super(key: key);

  @override
  State<OrderStatusTile> createState() => _OrderStatusTileState();
}

class _OrderStatusTileState extends State<OrderStatusTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.only(
          bottom: 40,
        ),
        leading: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 6,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xffFFFAEB),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(widget.image),
        ),
        title: Text(
          widget.status,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),

          //textAlign: TextAlign.left,
        ),
        // subtitle: Text(widget.subtitle),
        trailing: const Icon(
          Icons.check_circle,
          color: Color(0xff4CD964),
        ));
  }
}
