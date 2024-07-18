import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_demo/ui/views/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation vector1Animation;
  late Animation vector2Animation;
  late Animation vector3Animation;
  late Animation vector4Animation;
  late Animation vector5Animation;
  late Animation rectangleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    vector1Animation = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.easeInOut,
        ),
      ),
    );

    vector2Animation = Tween<double>(begin: -400.0, end: 50.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.3,
          curve: Curves.easeInOut,
        ),
      ),
    );

    vector3Animation = Tween<double>(begin: -400.0, end: 60.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.3,
          curve: Curves.easeInOut,
        ),
      ),
    );

    vector4Animation = Tween<double>(begin: -250, end: 180.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.3,
          0.4,
          curve: Curves.easeInOut,
        ),
      ),
    );

    vector5Animation = Tween<double>(begin: -250.0, end: 180.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.3,
          0.4,
          curve: Curves.easeInOut,
        ),
      ),
    );

    rectangleAnimation = Tween<double>(begin: -100.0, end: 260.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.3,
          0.4,
          curve: Curves.easeInOut,
        ),
      ),
    );

    Future.delayed(
      const Duration(seconds: 0),
    ).then(
      (value) => controller.forward().whenComplete(
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Stack(
            children: <Widget>[
              Positioned(
                top: vector1Animation.value,
                left: 40.0,
                right: 40.0,
                child: Image.asset('assets/images/Vector-1.png'),
              ),
              Positioned(
                top: 240.0,
                left: 110,
                right: vector2Animation.value,
                child: Image.asset('assets/images/Vector-2.png'),
              ),
              Positioned(
                top: 240.0,
                left: vector3Animation.value,
                right: 120, //vector3Animation.value,

                child: Image.asset('assets/images/Vector-3.png'),
              ),
              Positioned(
                top: vector4Animation.value,
                left: 50.0,
                right: 25.0,
                child: Image.asset('assets/images/Vector-4.png'),
              ),
              Positioned(
                top: vector5Animation.value, //180.0,
                left: 40.0,
                right: 85.0,
                child: Image.asset('assets/images/Vector-5.png'),
              ),
              Positioned(
                bottom: rectangleAnimation.value, //260.0,
                left: 70.0,
                right: 70.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  child: Center(
                    child: Text(
                      'Store Hub',
                      style: GoogleFonts.badScript(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
