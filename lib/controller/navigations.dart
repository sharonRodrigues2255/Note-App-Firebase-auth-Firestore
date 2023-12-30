import 'package:flutter/material.dart';
import 'package:flutter_check/main.dart';

navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  textToSpeechService.speak("Navigating to $page");
}

navigateReplacementTo(BuildContext context, Widget page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
  textToSpeechService.speak("Navigating to $page");
}

popScreen(BuildContext context) {
  Navigator.of(context).pop();
  textToSpeechService.speak("Exiting current page");
}
