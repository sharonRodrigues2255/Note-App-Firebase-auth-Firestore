import 'dart:async';

import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/controller/splash_screen_controller.dart';
import 'package:flutter_check/view/login_page/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider =
        Provider.of<SplashScreenController>(context, listen: false);
    provider.logoAnimation();
    Timer(Duration(seconds: 5), () {
      navigateTo(context, LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer<SplashScreenController>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: value.isLogoVisible,
                  replacement: FadeOutParticle(
                    duration: Duration(seconds: 2),
                    disappear: true,
                    child: Text(
                      "Valuing Life",
                      style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 8,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 127, 12, 4)),
                    ),
                  ),
                  child: Image.asset("assets/gristone_app_icon.png")),
            ],
          );
        },
      )),
    );
  }
}
