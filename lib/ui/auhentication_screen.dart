import 'package:flutter/material.dart';
import 'package:store_demo/shared/textfield.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  Image.asset('assets/images/fruitbasket2.png'),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/Ellipse-1.png')
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What is your firstname?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff27214D)),
                      ),
                      const SizedBox(height: 20),
                      TextfieldWidget(),
                      SizedBox(height: 20),
                      const Text(
                        'What is your email?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff27214D)),
                      ),
                      SizedBox(height: 20),
                      TextfieldWidget(),
                      const SizedBox(height: 30),
                      Container(
                        height: MediaQuery.of(context).size.height / 14,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: GestureDetector(
                          child: Center(
                              child: Text(
                            'Start Ordering',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onPrimary),
                          )),
                        ),
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
