import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/view/home_screen/home_screen.dart';
import 'package:flutter_check/view/login_page/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController with ChangeNotifier {
  bool isLogoVisible = true;

  logoAnimation() async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      isLogoVisible = false;
      notifyListeners();
    });
  }

  navigationfromSplash(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("loged") == true) {
      navigateReplacementTo(context, HomeScreen());
    } else {
      navigateReplacementTo(context, LoginScreen());
    }
  }
}
