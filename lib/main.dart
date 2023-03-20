import 'package:flutter/material.dart';
import 'package:notekeeper_app/screen/addauthor.dart';
import 'package:notekeeper_app/screen/homescreen.dart';
import 'package:notekeeper_app/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      routes: {
        '/' : (context) => SplashScreen(),
        'home' : (context) => HomeScreen(),
        'author' : (context) => AddAuthor(),
      },
    )
  );
}