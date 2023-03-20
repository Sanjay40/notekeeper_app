import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/variable.dart';

class CollectionHelper{

 static CollectionHelper instance = CollectionHelper();
  CollectionReference user = FirebaseFirestore.instance.collection('Author');
  insertDate(){
    return user.add({
      'AuthorName' : Author.authorName.text,
      'BookName' : Author.bookName.text,
    }).then((value) => print("data Add"))
    .onError((error, stackTrace) => print("error : ${error})"));
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
     'AuthorName' : Author.authorName.text,
     'BookName' : Author.bookName.text,
   })
       .then((value) => print("Data update"))
       .onError((error, stackTrace) => print("error :: ${error}"));
 }


}