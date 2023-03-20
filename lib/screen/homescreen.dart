import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: Column(
            children: [
              Text("Book Author",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Clr.bg,
                fontSize: 20
              ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Clr.bg,
        child: Icon(Icons.add),
      ),
    );
  }
}
