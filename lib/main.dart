import 'package:flutter/material.dart';
import 'package:notekeeper_app/screen/addnotes.dart';
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
        'note' : (context) => AddNotes()
      },
    )
  );
}