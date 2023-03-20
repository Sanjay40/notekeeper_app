import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/variable.dart';

class DatabaseHelper{

  static DatabaseHelper instance = DatabaseHelper();
  CollectionReference user = FirebaseFirestore.instance.collection('Data');
  insertData(){
    return user.add({
      'Title' : Notes.title.text,
      'Description' : Notes.des.text,
    })
        .then((value) => print("Data add"))
        .onError((error, stackTrace) => print("error :: ${error}"));
  }


  deleteDate({required int index}) async {
    var docSnap = await user.get();
    var docId = docSnap.docs;
    return user
        .doc(docId[index].id)
        .delete()
        .then((value) => print("Data Delete"))
        .onError((error, stackTrace) => print("error :: ${error}"));
  }

  updateData({required int index})async{
    var docSnap = await user.get();
    var docId = docSnap.docs;
    return user
        .doc(docId[index].id)
        .update({
             'Title' : Notes.title.text,
            'Description' : Notes.des.text,
         })
        .then((value) => print("Data update"))
        .onError((error, stackTrace) => print("error :: ${error}"));
  }

}