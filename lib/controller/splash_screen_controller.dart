import 'package:flutter/material.dart';

class SplashScreenController with ChangeNotifier {
  bool isLogoVisible = true;

  logoAnimation() async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      isLogoVisible = false;
      notifyListeners();
    });
  }
}
