import 'package:do_daily/auth/sigin_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context, 852, 393);
    return const SignInScreen();
  }
}
