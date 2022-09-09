import 'package:flutter/material.dart';
import 'package:store_demo/ui/auhentication_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/fruitbasket1.png'),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/Ellipse-1.png')
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff27214D)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff5D577E),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 70),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                          child: Text(
                        'Let\'s continue',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
