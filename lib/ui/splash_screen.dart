import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 300,
              left: 40,
              right: 40,
              //duration: const Duration(seconds: 7),
              //top: 100,
              child: Image.asset('assets/images/Vector-1.png'),
            ),
            Positioned(
              top: 240,
              left: 110,
              right: 50,
              //duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/Vector-2.png'),
            ),
            Positioned(
              top: 240,
              left: 60,
              right: 120,
              // duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/Vector-3.png'),
            ),
            Positioned(
              top: 180,
              left: 50,
              right: 25,
              //duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/Vector-4.png'),
            ),
            Positioned(
              top: 180,
              left: 40,
              right: 85,
              //duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/Vector-5.png'),
            ),
            Positioned(
              bottom: 240,
              left: 40,
              right: 40,
              //duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/Rectangle-47.png'),
            ),
            Positioned(
              bottom: 260,
              left: 130,
              child: Text(
                'Fruit Hub',
                style: GoogleFonts.badScript(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
