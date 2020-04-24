import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/widgetsFood/headerFood.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/widgetsFood/itemFood.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/widgetsFood/searchFood.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color.fromRGBO(248, 64, 0, 1),
        //backgroundColor: new Color.fromRGBO(240, 240, 240,90.0),
        body: SafeArea(
            bottom: true,
            child: Container(
              child: Column(children: <Widget>[
                HeaderFoodPage(),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: SearcherFoodPage(),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 20),
                    child: ItemFood(),
                  ),
                  flex: 1,
                )
              ]),
            )));
  }
}
