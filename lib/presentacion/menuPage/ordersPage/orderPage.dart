import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/negocios/completarPedido.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/models/orderItems.dart';

class OrderPage extends StatelessWidget {
  List<OrderItems> orderItems = [];

  Ordenes ordenes;

  getOrders() {
    List<OrderItems> ordenitem = new List<OrderItems>();
    for (EsqueletoOrdenes orden in ordenes.ordenes) {
      ordenitem.add(new OrderItems(
          number: orden.cantidad.toString(),
          text: orden.nombre,
          secondaryText: orden.guiso,
          amount: orden.total.toString()));
      // print(ordenitem.first.text);
    }
    return ordenitem;
  }

  Widget _headerFoodPage() {
    return Container(
      color: Color.fromRGBO(230, 81, 0, 1),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "TU ORDEN DEL DIA",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 3, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ya casi está listo",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.white70),
                )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ordenes = Provider.of<Ordenes>(context);
    orderItems = getOrders();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            //backgroundColor: Color.fromRGBO(248, 64, 0, 1),
            backgroundColor: Color.fromRGBO(230, 81, 0, 1),
            elevation: 0.0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "TU ORDEN",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Los detalles de tu pedido",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            )),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Pedido",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Precio",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: orderItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  orderItems[index].number,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    orderItems[index].text,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    orderItems[index].secondaryText,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$${orderItems[index].amount}.00",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(
                          thickness: 1.3,
                          color: Colors.grey.shade200,
                          height: 1,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  color: Colors.white12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.monetization_on,
                                color: Color.fromRGBO(239, 108, 0, 1),),
                            Text(
                              "Total:",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\$${ordenes.obtenerTotal()}.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: FlatButton(
                            onPressed: () {
                              if(!ordenes.vacio()){
                                _onPressComida(context);
                              }else{
                                Fluttertoast.showToast(msg: 'Registra comida');
                              }

                            },
                            child: Text(
                              "Ordenar",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            color: Color.fromRGBO(239, 108, 0, 1),
                            hoverColor: Colors.black26,
                            disabledTextColor: Colors.white30,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                style: BorderStyle.solid,
                                color: Color.fromRGBO(230, 81, 0, 1),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onPressComida(context) async {
  Ordenes ordenes = Provider.of<Ordenes>(context);
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
                                    " Hora a entregar",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontFamily: "SFUIDisplay"),
                                  ),
                                ],
                              ),
                            ),
                            HorasDropDown()
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: MaterialButton(
                          onPressed: () {
                            confirmarPedido(MismoPedido.idpedido, HorasDropDown.horas, ordenes.obtenerTotal(), ordenes).then((value){
                              Navigator.pop(context);                              
                            });
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
                            "Listo",
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
              ));
        });
      });
}

//horas
class HorasDropDown extends StatefulWidget {
  HorasDropDown() : super();
  final String title = "DropDown Demo";

  @override
  HorasDropDownState createState() => HorasDropDownState();

  static String horas = '';
}

class Horas {
  int id;
  String hora;

  Horas(this.id, this.hora);
  static List<Horas> getHoras() {
    return <Horas>[
      Horas(2, '07:55'),
      Horas(3, '08:50'),
      Horas(4, '09:45'),
      Horas(5, '10:40'),
      Horas(6, '11:35'),
      Horas(7, '12:30'),
      Horas(8, '13:25'),
      Horas(9, '14:20'),
      Horas(10, '15:15'),
    ];
  }
}

class HorasDropDownState extends State<HorasDropDown> {

  List<Horas> _horarios = Horas.getHoras();
  List<DropdownMenuItem<Horas>> _dropdownMenuItems;
  Horas _selectedHoras;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_horarios);
    _selectedHoras = _dropdownMenuItems[0].value;
    HorasDropDown.horas = _selectedHoras.hora;  
    super.initState();
  }

  List<DropdownMenuItem<Horas>> buildDropdownMenuItems(List horariosKfood) {
    List<DropdownMenuItem<Horas>> items = List();
    for (Horas horario in horariosKfood) {
      items.add(
        DropdownMenuItem(
          value: horario,
          child: Text(horario.hora),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Horas selectedCompany) {
    setState(() {
      _selectedHoras = selectedCompany;
    });
    HorasDropDown.horas = _selectedHoras.hora;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
            value: _selectedHoras,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),
        ],
      ),
    );
  }
}
