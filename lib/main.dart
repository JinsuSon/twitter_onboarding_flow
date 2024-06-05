import 'package:flutter/material.dart';
import 'package:twitter_onboarding_flow/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitter Onboarding Flow',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xff4b98eb),
        ),
        home: const InitialScreen());
  }
}
