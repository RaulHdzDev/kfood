import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/negocios/menuComida.dart';
import 'package:kfood_app/negocios/pedidoInicial.dart';
import 'package:kfood_app/negocios/pedidos.dart';
import 'package:kfood_app/negocios/pedidosIncompletos.dart';
import 'package:kfood_app/negocios/providers/cafeterias.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/guiso/guisosLogic.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/class/comida.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/datos_Comida.dart';
import 'package:flutter/cupertino.dart';
import 'package:kfood_app/negocios/providers/contCantidad.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePageLogic.dart';

import 'listaTiendas.dart';

class ItemFood extends StatefulWidget {
  @override
  _ItemFoodState createState() => _ItemFoodState();
}

class _ItemFoodState extends State<ItemFood> {
  ContCantidad cantidad;
  _abrirPagCantidad(BuildContext context) async {
    cantidad = Provider.of<ContCantidad>(context);
  }

  Ordenes ordenes;

  final List<DatosComida> tripsList = [];
  static int vari = 0;
  _ItemFoodState ifd;
  @override
  void initState() {
    super.initState();
    Timer(new Duration(milliseconds: 1), abrirPag);
    ifd = this;
  }
  String idCafe;
  void updateState(String id) {
    idCafe = id;
    abrirPag();
    setState(() {});
  }

  void imprimirLista(Comidas lista) {
    tripsList.clear();
    for (Comida item in lista.comidas) {
      if (item.estado == 'Disponible') {
        tripsList.add(DatosComida(item.nombreComida,
            double.parse(item.precioUnitario), item.idComida));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // _agregarPedInicial(context);
    return Container(
      child: Column(
        children: <Widget>[
          _headerFoodPage(),
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(CupertinoIcons.play_arrow, color: Colors.black54),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tienda: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black54),
                          )),
                    ],
                  ),
                  TiendasDropDown(ifd)
                ],
              )),
          _listaComida()
        ],
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
      color: Color.fromRGBO(230, 81, 0, 1),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 30),
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
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "El menú del día.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.white70),
                )),
          ),
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
        _onPressComida(trip.comida, trip.precio.ceil(), trip.idcomida);
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
                                color: Color.fromRGBO(230, 81, 0, 1),
                                size: 15,
                              ),
                              Text(
                                "  " + trip.comida,
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "SFUIDisplay",
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(230, 81, 0, 1)),
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
    final Cafeterias cafeterias = Provider.of<Cafeterias>(context);
    comidas.limpiarLista();
    if (idCafe!=null){
      print("cafeteria: $idCafe");
      await traerComida(comidas, idCafe);
    }else{
      print("cafeteria: ${cafeterias.cafeterias}");
      await traerComida(comidas, cafeterias.cafeterias);
    }

    imprimirLista(comidas);
  }

  void abrirPag() {
    _abrirPaginaComidas(context);
    _abrirPagCantidad(context);
  }

  void _onPressComida(String comida, int precio, String idcomida) async {
    ordenes = Provider.of<Ordenes>(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
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
                          color: Color.fromRGBO(230, 81, 0, 1),
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
                                  " Precio unitario",
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
                                  " Cantidad",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontFamily: "SFUIDisplay"),
                                ),
                              ],
                            ),
                          ),
                          Contador()
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
                                  " Guiso",
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
                    padding: EdgeInsets.only(top: 20, right: 15, left: 15),
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
                          //NO agreges el TEXT
                          //La clase PrecioTotal muestra ese TEXT
                          PrecioTotal(
                            precio: precio,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: MaterialButton(
                        onPressed: ordenes.showButton
                            ? null
                            : () {
                                ordenes = Provider.of<Ordenes>(context);
                                if (ordenes.vacio()) {
                                  getProfileData().then((value) {
                                    MismoPedido.idusuario = value.id_usuarios;
                                    registrarPedidoInicial(
                                            MismoPedido.idusuario)
                                        .then((valu) {
                                      agregarOrden(
                                          comida,
                                          cantidad.cont,
                                          GuisosDropDown.selectguiso,
                                          precio * cantidad.cont,
                                          MismoPedido.idpedido,
                                          idcomida,
                                          GuisosDropDown.selectidguiso);
                                    });
                                  });
                                } else {
                                  agregarOrden(
                                      comida,
                                      cantidad.cont,
                                      GuisosDropDown.selectguiso,
                                      precio * cantidad.cont,
                                      MismoPedido.idpedido,
                                      idcomida,
                                      GuisosDropDown.selectidguiso);
                                }
                                Fluttertoast.showToast(
                                    msg: "Se agregó a tu orden",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1);
                                Navigator.pop(context);
                              },
                        textColor: Colors.black54,
                        height: 55,
                        minWidth: MediaQuery.of(context).size.width - 50,
                        highlightColor: Color.fromRGBO(239, 108, 0, 1),
                        splashColor: Color.fromRGBO(239, 108, 0, 1),
                        colorBrightness: Brightness.dark,
                        textTheme: ButtonTextTheme.accent,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color.fromRGBO(230, 81, 0, 1),)),
                        child: Text(
                          "Agregar a orden",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(230, 81, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: "SFUIDisplay"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  agregarOrden(String nombre, int cantidad, String guiso, int total,
      String idpedido, String idcomida, String idguiso) async {
    ordenes = Provider.of<Ordenes>(context);
    ContCantidad cantidadActualizar = Provider.of<ContCantidad>(context);
    EsqueletoOrdenes pedir = new EsqueletoOrdenes(
        nombre: nombre,
        cantidad: cantidad,
        guiso: guiso,
        total: total,
        idpedido: idpedido,
        idcomidas: idcomida,
        idguisos: idguiso);
    registrarPedido(idpedido, idcomida, idguiso, cantidad.toString())
        .then((value) {
      cantidadActualizar.reiniciarCont();
      ordenes.agregar(pedir, value);
    });
  }
}

class PrecioTotal extends StatefulWidget {
  @override
  _PrecioTotalState createState() => _PrecioTotalState();
  var precio;
  PrecioTotal({this.precio});
}

class _PrecioTotalState extends State<PrecioTotal> {
  @override
  Widget build(BuildContext context) {
    ContCantidad cantidad = Provider.of<ContCantidad>(context);
    return Text(
      "\$${(widget.precio * cantidad.cont).toStringAsFixed(2)}",
      style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "SFUIDisplay"),
    );
  }
}

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State {
  ContCantidad cantidad;
  _abrirPagCantidad(BuildContext context) {
    cantidad = Provider.of<ContCantidad>(context);
  }

  @override
  void initState() {
    // _abrirPagCantidad(context);
    super.initState();
    // Timer(new Duration(milliseconds: 1), _abrirCantidad);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _abrirPagCantidad(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            cantidad.cont = cantidad.cont - 1;
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
        Text("${cantidad.cont}"),
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            cantidad.cont = cantidad.cont + 1;
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
  static String selectguiso = '';
  static String selectidguiso = '';
  final String title = "Guisos disp.";

  @override
  GuisosDropDownState createState() => GuisosDropDownState();
}

class GuisosDatos {
  String id;
  String name;

  GuisosDatos(this.id, this.name);
  static Future<List<GuisosDatos>> getGuisos() async {
    List<GuisosDatos> guisos = new List<GuisosDatos>();
    guisos = await getGuisosList();
    return guisos;
  }
}

class GuisosDropDownState extends State<GuisosDropDown> {
  obtenerGuisos() async {
    await getGuisosList().then((lista) {
      setState(() {
        _guisos = lista;
        _dropdownMenuItems = buildDropdownMenuItems(_guisos);
        _selectGuiso = _dropdownMenuItems[0].value;
      });
      Ordenes ordenes = Provider.of<Ordenes>(context);
      ordenes.showButton = true;
      GuisosDropDown.selectguiso = lista.first.name;
      GuisosDropDown.selectidguiso = lista.first.id.toString();
    });
  }

  void obtener() {
    obtenerGuisos();
  }

  List<GuisosDatos> _guisos = new List<GuisosDatos>();
  List<DropdownMenuItem<GuisosDatos>> _dropdownMenuItems;
  GuisosDatos _selectGuiso;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_guisos);
    super.initState();
    Timer(new Duration(milliseconds: 1), obtener);
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
    GuisosDropDown.selectguiso = selectedGuisos.name;
    GuisosDropDown.selectidguiso = selectedGuisos.id.toString();
  }

  @override
  Widget build(BuildContext context) {
    Ordenes ordenes = Provider.of<Ordenes>(context);
    ordenes.showButton = false;
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
