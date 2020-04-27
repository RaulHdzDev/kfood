
import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/guiso/datos_Guisos.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/guiso/guisosLogic.dart';

class Guisos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color.fromRGBO(248, 64, 0, 1),
        //backgroundColor: new Color.fromRGBO(240, 240, 240,90.0),
        body: SafeArea(
            bottom: true,
            child: Container(
              child: Column(children: <Widget>[
                _headerGuisoPage(),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: _searcherGuisoPage(context),
                ),

                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 20),
                    child: HomeViewGuiso(),
                  ),
                  flex: 1,
                )
              ]),
            )));
  }




 Widget _headerGuisoPage() {
 return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "A continuación",
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
                  " Elige el guiso",
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





 Widget _searcherGuisoPage(BuildContext context) {
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
          hintText: 'Huevo verde, Asado, Frijoles, ...',
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




}





class HomeViewGuiso extends StatelessWidget {
  final List<DatosGuiso> tripsList = [];

  Future<void> setTrips(List<DatosGuiso> trips) async{
    for (var item in trips){
      tripsList.add(item);
    }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadGuisos(),
      builder: (context, AsyncSnapshot snapshot){
        return Container(
          child: new ListView.builder(
              itemCount: tripsList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildTripCard(context, index)),
        );
      },
    );

  }


  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return new Container(
      child: InkWell(
      splashColor: Colors.black,
      onTap: () async {
      print("tapped" + trip.guiso);  
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
                              Icon(Icons.fastfood, color:  Color.fromRGBO(248, 64, 0, 1), size: 15,),
                              Text(
                                "  " + trip.guiso,
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
                      //"\$${trip.precioguiso.toStringAsFixed(2)}",
                      "",
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

  Future loadGuisos() async {
    print("Inicio la carga");
    await setTrips(await getGuisosList());
    print("Termino la carga");
    return;
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