import 'package:flutter/material.dart';
import 'package:store_demo/ui/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xffFFA451),
        fontFamily: 'BrandonGrotesque',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xff27214D)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
