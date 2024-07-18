import 'package:flutter/material.dart';
import 'package:store_demo/ui/shared/order_status_tile.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
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
                      child: const Row(children: [
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
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Delivery Status',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xffFFFFFF),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
                    children: const [
                      OrderStatusTile(
                        image: 'assets/images/orders.png',
                        status: 'Order Taken',
                      ),
                      OrderStatusTile(
                          image: 'assets/images/prepare_order.png',
                          status: 'Order Is Being Prepared'),
                      OrderStatusTile(
                        image: 'assets/images/delivery-man.png',
                        status: 'Order is being delivered',
                        subtitle: 'Your delivery agent is coming',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
