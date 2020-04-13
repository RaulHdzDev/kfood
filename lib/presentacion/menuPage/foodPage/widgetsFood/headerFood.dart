import 'package:flutter/material.dart';

class HeaderFoodPage extends StatelessWidget {
  const HeaderFoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Elige tu comida",
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " ¿Qué comeremos hoy?",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.white70),
                )),
          )
        ],
      ),
    );
  }
}
