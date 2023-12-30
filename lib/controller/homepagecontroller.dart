import 'package:flutter/material.dart';

class HomepageController with ChangeNotifier {
  double fontsize = 1;

  increasefontsize(double value) {
    fontsize = fontsize * value;
    notifyListeners();
  }

  TextStyle myfontStyle({double size = 22}) {
    return TextStyle(fontSize: size * fontsize);
  }
}
