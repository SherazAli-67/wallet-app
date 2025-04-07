import 'package:flutter/material.dart';
import 'package:wallet_app/src/features/welcome_page.dart';
import 'package:wallet_app/src/res/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: appFontFamily
      ),
      home: WelcomePage()
    );
  }
}
