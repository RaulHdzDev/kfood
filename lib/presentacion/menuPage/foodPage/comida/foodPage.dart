import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/negocios/menuComida.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/class/comida.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/datos_Comida.dart';
import 'package:flutter/cupertino.dart';

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

  void imprimirLista(Comidas lista) {
    for (Comida item in lista.comidas) {
      if (item.estado == 'Disponible') {
        tripsList.add(
            DatosComida(item.nombreComida, double.parse(item.precioUnitario)));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_headerFoodPage(), _listaComida()],
      ),
    );
  }

  Widget _listaComida() {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: tripsList.length,
      itemBuilder: (BuildContext context, int index) =>
          buildTripCard(context, index),
    ));
  }

  Widget _headerFoodPage() {
    return Container(
      color: Color.fromRGBO(248, 64, 0, 1),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 45),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Elige tu comida",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 15),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "El menú del día.",
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

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return new Container(
        child: InkWell(
      splashColor: Colors.black,
      onTap: () {
        _onPressComida(trip.comida, trip.precio.ceil());
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
                              Icon(
                                Icons.fastfood,
                                color: Color.fromRGBO(248, 64, 0, 1),
                                size: 15,
                              ),
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
                      style: new TextStyle(
                          fontSize: 30.0, fontFamily: "SFUIDisplay"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  _abrirPaginaComidas(BuildContext context) async {
    final Comidas comidas = Provider.of<Comidas>(context);
    comidas.limpiarLista();
    await traerComida(comidas);
    imprimirLista(comidas);
  }

  void abrirPag() {
    _abrirPaginaComidas(context);
  }

  void _onPressComida(String comida, int precio) async {
    final _precio = precio;
    int _count = 1;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          
          return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {

          return Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 90,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 20),
                  child: Container(
                    child: Text(
                      comida,
                      style: TextStyle(
                        color: Color.fromRGBO(248, 64, 0, 1),
                        letterSpacing: 1.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 15,
                    left: 15,
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(CupertinoIcons.info),
                              Text(
                                " Precio unitario.",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontFamily: "SFUIDisplay"),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\$${precio.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SFUIDisplay"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 15,
                    left: 15,
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(CupertinoIcons.forward),
                              Text(
                                " Cantidad.",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontFamily: "SFUIDisplay"),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_count > 1) _count -= 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text("$_count"),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_count < 10) _count += 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(CupertinoIcons.forward),
                              Text(
                                " Guiso.",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontFamily: "SFUIDisplay"),
                              ),
                            ],
                          ),
                        ),
                        GuisosDropDown()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, right: 15, left: 15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(CupertinoIcons.tag),
                              Text(
                                " TOTAL",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black87,
                                    fontFamily: "SFUIDisplay"),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "\$${(_precio * _count).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SFUIDisplay"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Se agregó a tu orden",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1);
                      },
                      textColor: Colors.black54,
                      height: 55,
                      minWidth: MediaQuery.of(context).size.width - 50,
                      highlightColor: Colors.red,
                      splashColor: Colors.red,
                      colorBrightness: Brightness.dark,
                      textTheme: ButtonTextTheme.accent,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      child: Text(
                        "Agregar a orden",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SFUIDisplay"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
          }
          );
        });
  }
}

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (_count > 0) _count -= 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.remove),
          ),
        ),
        SizedBox(width: 10.0),
        Text("$_count"),
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            setState(() {
              if (_count < 10) _count += 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class GuisosDropDown extends StatefulWidget {
  GuisosDropDown() : super();

  final String title = "Guisos disp.";

  @override
  GuisosDropDownState createState() => GuisosDropDownState();
}

class GuisosDatos {
  int id;
  String name;

  GuisosDatos(this.id, this.name);

  static List<GuisosDatos> getGuisos() {
    return <GuisosDatos>[
      GuisosDatos(1, 'Huevo Verde'),
      GuisosDatos(2, 'Picadillo'),
      GuisosDatos(3, 'Frijoles'),
      GuisosDatos(4, 'Requeson'),
      GuisosDatos(5, 'Chicharrón'),
    ];
  }
}

class GuisosDropDownState extends State<GuisosDropDown> {
  //
  List<GuisosDatos> _guisos = GuisosDatos.getGuisos();
  List<DropdownMenuItem<GuisosDatos>> _dropdownMenuItems;
  GuisosDatos _selectGuiso;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_guisos);
    _selectGuiso = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<GuisosDatos>> buildDropdownMenuItems(List guisos) {
    List<DropdownMenuItem<GuisosDatos>> items = List();
    for (GuisosDatos guiso in guisos) {
      items.add(
        DropdownMenuItem(
          value: guiso,
          child: Text(guiso.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(GuisosDatos selectedGuisos) {
    setState(() {
      _selectGuiso = selectedGuisos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
            value: _selectGuiso,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),
        ],
      ),
    );
  }
}
