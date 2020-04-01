
import 'package:flutter/material.dart';
 
 
class MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',

      home: Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
          backgroundColor: Color.fromRGBO(248, 64, 0, 1),
        ),
        body: Center(
          child: Container(
          ),
        ),
      ),
    );
  }
}
