import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.pushReplacementNamed(context, 'home'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:Clr.bg,
        ),
        alignment: Alignment.center,
        child: Center(
          child: DelayedDisplay(
            delay: Duration(seconds: 2),
            child: Image(
              image: AssetImage('images/author-removebg-preview.png',),
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
