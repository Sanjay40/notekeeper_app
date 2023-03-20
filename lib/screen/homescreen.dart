import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/collectionhelper.dart';
import '../utils/colors.dart';
import '../utils/variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionHelper dbHelper = CollectionHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Book Author",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Clr.bg,
                fontSize: 20
              ),
              ),
              Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Author').snapshots(),
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Text("Please value is Valid");
                      }
                      else if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      else
                        {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context,index){
                                  Author.data = snapshot.data!.docs;
                                  return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        Author.state = false;
                                        Navigator.pushNamed(context, 'author',arguments: index);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Card(
                                       elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          title: Text("${snapshot.data!.docs[index]['AuthorName']}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Clr.bg,
                                                letterSpacing: 0.5
                                            ),
                                          ),
                                          subtitle: Text("${snapshot.data!.docs[index]['BookName']}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Clr.bg,
                                                letterSpacing: 0.5
                                            ),
                                          ),
                                          trailing: GestureDetector(
                                            onTap: (){
                                              dbHelper.deleteDate(index: index);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Clr.bg,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
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
            Author.state = true;
          });
          Navigator.pushNamed(context, 'author');
        },
        backgroundColor: Clr.bg,
        child: Icon(Icons.add),
      ),
    );
  }
}
