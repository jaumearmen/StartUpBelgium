import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:startup/ui/login/sign_in_view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/images/logo_letra.png'),
          splashTransition: SplashTransition.fadeTransition,
          duration: 1000,
          nextScreen: SignInView()),
    );
  }
}
