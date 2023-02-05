import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salaa_app/view/screens/homeScreen.dart';
import 'package:salaa_app/view/screens/navScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      splash: SvgPicture.asset("assets/icons/tasbeh.svg"),
      nextScreen: NavScreen(),
    );
  }
}
