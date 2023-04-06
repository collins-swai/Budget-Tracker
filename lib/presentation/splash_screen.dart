import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:budget_tracker/presentation/movie_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 4500,
        splash: Image.asset(
          "assets/images/logo_black-1.png",
        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
      ),
    );
  }
}
