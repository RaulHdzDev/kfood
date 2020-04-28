import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/shop_page.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Kfood',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeShop(),
        ),
      ),
    );
  }
}
