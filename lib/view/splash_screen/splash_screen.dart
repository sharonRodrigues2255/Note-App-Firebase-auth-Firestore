import 'dart:async';

import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/navigations.dart';
import 'package:flutter_check/controller/splash_screen_controller.dart';
import 'package:flutter_check/controller/text_to_speech_controller.dart';
import 'package:flutter_check/view/home_screen/home_screen.dart';
import 'package:flutter_check/view/login_page/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    TextToSpeechService().speak("Welcome user");
    final provider =
        Provider.of<SplashScreenController>(context, listen: false);
    provider.logoAnimation();
    Timer(Duration(seconds: 5), () {
      provider.navigationfromSplash(context);
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
                    duration: Duration(seconds: 3),
                    disappear: true,
                    child: Text(
                      "About 2023",
                      style: GoogleFonts.merriweather(
                          color: Colors.black, fontSize: 32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Powered by"),
                      SizedBox(
                          child: Image.asset("assets/gristone_app_icon.png")),
                    ],
                  )),
            ],
          );
        },
      )),
    );
  }
}
