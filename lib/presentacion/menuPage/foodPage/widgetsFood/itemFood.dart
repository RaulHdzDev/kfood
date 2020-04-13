import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/widgetsFood/datos_Comida.dart';

class HomeView extends StatelessWidget {
  final List<DatosComida> tripsList = [
    DatosComida("Hamburguesa", 25.00),
    DatosComida("Taco de Maiz", 7.00),
    DatosComida("Migada",  25.00),
    DatosComida("Platillo", 35.00),
    DatosComida("Taco de Harina", 7.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return new Container(
      child: InkWell(
      splashColor: Colors.black,
      onTap: () async {
      print("tapped" + trip.comida);  
      showFancyCustomDialog(context);
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
                              Icon(Icons.fastfood, color: Colors.redAccent, size: 15,),
                              Text(
                                "  " + trip.comida,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "SFUIDisplay",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
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


void showFancyCustomDialog(BuildContext context) {
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
                    color: Colors.redAccent,
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
