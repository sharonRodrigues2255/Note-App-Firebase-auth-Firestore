import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareAMemoryController with ChangeNotifier {
  Future<void> addAmemmory({
    required String title,
    required String note,
    required BuildContext context,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');

    var connectivityResult = await (Connectivity().checkConnectivity());
    print("?/////////////////////////////////////////////$connectivityResult");

    final newMemory = {
      'username': preferences.getString("username") ?? "sr979151@gmail.com",
      'title': title,
      'note': note,
      'date':
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
    };

    if (connectivityResult == ConnectivityResult.none) {
      saveMemoryLocally(newMemory);

      showToast(
          'Memory saved offline. Syncing will occur when the connection is restored.');
      textToSpeechService.speak(
          'Memory saved offline. Syncing will occur when the connection is restored.');

      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    } else {
      await notes
          .add(newMemory)
          .then((value) => showToast('Note Added'))
          .catchError((error) => showToast('Failed to add note: $error'));

      await syncLocalMemories();

      showToast('Memory submitted successfully');
      textToSpeechService.speak('Memory submitted successfully');

      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    }
  }

  Future<void> saveMemoryLocally(Map<String, dynamic> memory) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> localMemories =
        preferences.getStringList('local_memories') ?? [];
    localMemories.add(json.encode(memory));
    preferences.setStringList('local_memories', localMemories);
  }

  Future<void> syncLocalMemories() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> localMemories =
        preferences.getStringList('local_memories') ?? [];

    CollectionReference notes = FirebaseFirestore.instance.collection('notes');

    for (String localMemoryString in localMemories) {
      Map<String, dynamic> localMemory = json.decode(localMemoryString);
      await notes
          .add(localMemory)
          .then((value) => showToast('Local memory synced'))
          .catchError(
              (error) => showToast('Failed to sync local memory: $error'));
    }
    preferences.remove('local_memories');
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
