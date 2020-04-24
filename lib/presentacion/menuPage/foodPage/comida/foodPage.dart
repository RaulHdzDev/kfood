
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kfood_app/negocios/menuComida.dart';
import 'package:provider/provider.dart';

import 'package:kfood_app/negocios/class/comida.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';
import 'package:kfood_app/presentacion/loginPage/loginLogic.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/datos_Comida.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/datos_Comida.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/guiso/guisos.dart';


// ---------------------------------------------------------------------------------
// CAMBIOS DE MONO ARRIBA



class ItemFood extends StatefulWidget {
  @override
  _ItemFoodState createState() => _ItemFoodState();
}

class _ItemFoodState extends State<ItemFood> {
  final List<DatosComida> tripsList = [];
  static int vari = 0;
  @override
  void initState() { 
    super.initState();
    Timer(new Duration(milliseconds: 1), abrirPag);
  }

  void imprimirLista(Comidas lista){
    for (Comida item in lista.comidas) {
      if(item.estado == 'Disponible'){
        tripsList.add(DatosComida(item.nombreComida, double.parse(item.precioUnitario)));
      }
    }
    setState(() {
      
    });
  }

@override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
    return Scaffold(
      
        backgroundColor:  Color.fromRGBO(248, 64, 0, 1),
        //backgroundColor: new Color.fromRGBO(240, 240, 240,90.0),
        body: SafeArea(
            bottom: true,
            child: Container(
              child: Column(children: <Widget>[
                _headerFoodPage(),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: _searcherFoodPage(context),
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

  Widget _headerFoodPage() {
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


  
Widget _searcherFoodPage(BuildContext context) {
  return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        autofocus: false,
        cursorColor: Colors.white,
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'SFUIDisplay',
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(244, 67, 54, 90.0),
          hintText: 'Tacos, Sopes, Migadas, ...',
          hintStyle: TextStyle(
            color: Colors.white30,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white70,
          ),
          contentPadding: EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Color.fromRGBO(248, 64, 0, 1)),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:  Color.fromRGBO(248, 64, 0, 1)),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
      ),
    );
  }


  Widget buildTripCard(BuildContext context, int index) {

    final trip = tripsList[index];
    return new Container(
      child: InkWell(
      splashColor: Colors.black,
      onTap: () async {

      print("tapped" + trip.comida);  
      // showFancyCustomDialog(context);
        /*
        Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context)=> Guisos(),
                          )
                      );
                      */

                      
      /*print("tapped" + trip.comida);  
      detallespedido(context);
      */
      },




      child: Card(
        color: Colors.white,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white54,
                      child: Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 50,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 100,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 5, left: 5, bottom: 5),
                            child: Row(children: <Widget>[
                              Icon(Icons.fastfood, color:  Color.fromRGBO(248, 64, 0, 1), size: 15,),
                              Text(
                                "  " + trip.comida,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "SFUIDisplay",
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(248, 64, 0, 1)),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 8.0, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "\$${trip.precio.toStringAsFixed(2)}",
                      style: new TextStyle(fontSize: 30.0, fontFamily: "SFUIDisplay"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }

  _abrirPaginaComidas(BuildContext context) async{

    final Comidas comidas = Provider.of<Comidas>(context);
    await traerComida(comidas);
    imprimirLista(comidas);

  }

void abrirPag(){
  _abrirPaginaComidas(context);
}



void detallespedido(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 300.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Detalles de pedido:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),



            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  print("Click Order");
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color:  Color.fromRGBO(248, 64, 0, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Agregar al carrito!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),



            Align(
        // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
 }



}



