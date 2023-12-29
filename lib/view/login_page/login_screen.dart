import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/utils/constants/spaces.dart';
import 'package:flutter_check/view/home_screen/home_screen.dart';
import 'package:flutter_check/view/login_page/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_image.jpeg"),
                ),
              ),
            ),
            kheight20,
            kheight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            kheight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateReplacementTo(context, HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            kheight20,
            Text.rich(TextSpan(text: "New user? ", children: [
              TextSpan(
                  text: "Register",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      navigateReplacementTo(context, RegistrationScreen());
                    },
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue))
            ]))
          ],
        ),
      ),
    );
  }
}
