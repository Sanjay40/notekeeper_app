import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper_app/helper/databasehelper.dart';
import 'package:notekeeper_app/utils/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/colors.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
   GlobalKey<FormState> validateKey = GlobalKey<FormState>();
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
   int? index = ModalRoute.of(context)?.settings.arguments as int?;
   print("$index");
   WidgetsBinding.instance.addPostFrameCallback((_) {
     Notes.title.text = Notes.data[index!]['Title'];
      Notes.des.text = Notes.data[index]['Description'];
   });
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: Form(
            key: validateKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---------- title --------------

                Text("Title",
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
                    controller: Notes.title,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please Enter The Title";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15),
                      hintText: "Enter The Notes Title",
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

                Text("Description",
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
                    controller: Notes.des,
                    maxLines: 15,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please Enter The Description";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,vertical: 15),
                        hintText: "Enter The Notes Description",
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
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
          if(validateKey.currentState!.validate()){
           if(Notes.state == true)
            {
              dbHelper.insertData();
            }
           else
             {
               dbHelper.updateData(index: index!);
             }
          }
        },
        backgroundColor: Clr.bg,
        child: Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}
