import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:store_demo/ui/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // return AnimatedSplashScreen(
    //   splash: Column(
    //     children: [
    //       Image.asset('assets/images/Vector-1.png'),
    //     ],
    //   ),
    //   nextScreen: const WelcomeScreen(),
    //   splashTransition: SplashTransition.slideTransition,
    //   duration: 10000,
    // );
    return Container();
  }
}
