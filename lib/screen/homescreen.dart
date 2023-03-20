import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/databasehelper.dart';
import '../utils/colors.dart';
import '../utils/variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,top: 8,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Note kepper",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Clr.bg,
                    fontSize: 22
                ),

              ),
              SizedBox(height: 10,),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Data').snapshots(),
                    builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Text("Please value is Valid");
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          Notes.data = snapshot.data!.docs;
                          print(Notes.data);
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                Notes.state = false;
                                Navigator.pushNamed(context, 'note',arguments: index);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: ListTile(
                                  title: Text("${snapshot.data!.docs[index]['Title']}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Clr.bg,
                                    letterSpacing: 0.5
                                  ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("${snapshot.data!.docs[index]['Description']}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Clr.bg,
                                          letterSpacing: 0.5
                                      ),
                                    ),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: (){
                                      dbHelper.deleteDate(index: index);
                                    },
                                    child: Icon(Icons.delete,
                                    color: Clr.bg,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Notes.state = true;
          });
          Navigator.pushNamed(context, 'note');
        },
        backgroundColor: Clr.bg,
        child: Icon(Icons.file_present),
      ),
    );
  }
}
