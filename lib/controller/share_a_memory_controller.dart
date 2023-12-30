import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareAMemoryController with ChangeNotifier {
  addAmemmory({
    required String title,
    required String note,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');

    return notes
        .add({
          'username': preferences.getString("username") ?? "sr979151@gmail.com",
          'title': title,
          'note': note,
          "date":
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
        })
        .then((value) => print("notes Added"))
        .catchError((error) => print("Failed to add note: $error"));
  }
}
