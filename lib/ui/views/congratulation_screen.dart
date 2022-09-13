import 'package:flutter/material.dart';
import 'package:store_demo/ui/views/track_order_screen.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 40),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    color: const Color(0xffE0FFE5),
                    border:
                        Border.all(width: 2.0, color: const Color(0xff4CD964)),
                    borderRadius: BorderRadius.circular(70)),
                child: const Icon(
                  Icons.check_circle_sharp,
                  size: 100,
                  color: Color(0xff4CD964),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Congratulations!!!',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Your order has been taken and is being attended to.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TrackOrderScreen(),
                ));
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                    child: Text(
                  'Track Order',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary),
                )),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
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
