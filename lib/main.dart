import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';
import 'package:kfood_app/presentacion/pantallaCarga/splash.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: SplashScreen(),
    ),
      debugShowCheckedModeBanner: false,
    );
  }
}