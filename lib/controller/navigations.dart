import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

navigateReplacementTo(BuildContext context, Widget page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

popScreen(BuildContext context) {
  Navigator.of(context).pop();
}
