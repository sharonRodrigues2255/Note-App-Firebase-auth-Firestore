import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/login_controller.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/main.dart';
import 'package:flutter_check/utils/constants/spaces.dart';
import 'package:flutter_check/view/login_page/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    textToSpeechService.speak("Login with email and password");
    super.initState();
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context);
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
                controller: emailController,
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
                controller: passwordController,
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
                provider.loginWithEmailandpassword(
                    emailController.text, passwordController.text,
                    context: context);
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
