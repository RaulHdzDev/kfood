
import 'package:flutter/material.dart';
 
 
class MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
          ),
        ),
      ),
    );
  }
}
