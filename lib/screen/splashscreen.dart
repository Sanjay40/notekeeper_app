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
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, 'home'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Clr.bg,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Image(
                  image: AssetImage('images/n1-re.png',),
                  height: 280,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
