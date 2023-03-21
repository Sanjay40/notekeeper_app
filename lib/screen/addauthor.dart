import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper_app/helper/collectionhelper.dart';

import '../utils/colors.dart';
import '../utils/variable.dart';

class AddAuthor extends StatefulWidget {
  const AddAuthor({Key? key}) : super(key: key);

  @override
  State<AddAuthor> createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {

  GlobalKey<FormState> validateKey = GlobalKey<FormState>();
  CollectionHelper dbHelper = CollectionHelper.instance;
  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    print("$index");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Author.authorName.text = Author.data[index!]['AuthorName'];
      Author.bookName.text = Author.data[index]['BookName'];
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: Form(
            key: validateKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Author Name",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Clr.bg,
                      fontSize: 18,
                      letterSpacing: 1
                  ),

                ),

                SizedBox(height: 3),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextFormField(
                    controller: Author.authorName,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please Enter The Author Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15),
                        hintText: "Enter The Author Name",
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade300,
                            fontSize: 15
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                        errorStyle: GoogleFonts.poppins(height: 3)
                    ),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Clr.bg,
                        fontSize: 15
                    ),
                  ),
                ),


                // ---------- Description --------------
                SizedBox(height: 20),

                Text("Book Name",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Clr.bg,
                      fontSize: 18,
                      letterSpacing: 1
                  ),

                ),

                SizedBox(height: 5),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextFormField(
                    controller: Author.bookName,
                    maxLines: 2,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please Enter The Book Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,vertical: 15),
                        hintText: "Enter The Book Name",
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade300,
                            fontSize: 15
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                        errorStyle: GoogleFonts.poppins(height: 3)
                    ),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Clr.bg,
                        fontSize: 15
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          if(validateKey.currentState!.validate()){
            if(Author.state == true)
            {
              dbHelper.insertDate();
            }
            else
            {
              dbHelper.updateData(index: index!);
            }
            Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
          }

        },
        backgroundColor: Clr.bg,
        child: Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}
