import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check/controller/login_controller.dart';
import 'package:flutter_check/controller/splash_screen_controller.dart';
import 'package:flutter_check/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCbbq-fqJ7s6OP1mhSH9C-SXa5az_eHJrE',
          appId: "1:825841609274:android:dfa114292e1d9439a9e303",
          messagingSenderId: '',
          projectId: "griststone-task"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashScreenController()),
        ChangeNotifierProvider(create: (context) => LoginController())
      ],
      child: MaterialApp(
        title: 'Gritsone task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
