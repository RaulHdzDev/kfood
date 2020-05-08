import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/negocios/class/pedComGui.dart';
import 'package:kfood_app/negocios/providers/carritoIncompleto.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/models/orderItems.dart';

class OrderPage extends StatelessWidget{
  List<OrderItems> orderItems = [];

  Ordenes ordenes;
  CarritoIncompleto carritos;
  getOrders(){
    List<OrderItems> ordenitem = new List<OrderItems>();
    if(ordenitem != null){
      for (EsqueletoOrdenes orden in ordenes.ordenes) {
      print("OrderItem");
      ordenitem.add(new OrderItems(number: orden.cantidad.toString(), text: orden.nombre, secondaryText: orden.guiso, amount: orden.total.toString()));
      }
    }
    else if(carritos.vacio() == false){
      print("carrito");
      for(PedComGui ordenI in carritos.carritoIncompleto){
        ordenitem.add(new OrderItems(number: ordenI.cantidad, text: ordenI.nombreComida, secondaryText: ordenI.nombreguiso, amount: ordenI.precioUnitario));
      }
    }
    
    return ordenitem;
  }

   Widget _headerFoodPage() {
    return Container(
      color: Color.fromRGBO(248, 64, 0, 1),
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
    return Container(
      child: Column(
        children: <Widget>[
          _headerFoodPage(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Pedido",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                       Text("Precio",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
 
                    ],
                  ),
                  ListView.builder(
                    itemCount: orderItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child: Text(orderItems[index].number,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                ),
                              ),
 
                              SizedBox(width: 8,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(orderItems[index].text,style: TextStyle(fontWeight: FontWeight.w600),),
                                    SizedBox(height: 8,),
                                    Text(orderItems[index].secondaryText,style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                                  ],
                                ),
                              ),
                              Text(orderItems[index].amount,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 14,),
                          Divider(thickness: 1.3,color: Colors.grey.shade200,height: 1,),
                          SizedBox(height: 14,),
                        ],
                      );
                    },
                  ),
                  
 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Total",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),),
                      Text("\$${ordenes.obtenerTotal()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    ],
                  ),
 
            
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 80,
                padding: EdgeInsets.only(top: 35),
                child: FlatButton(
                  onPressed: (){
                     _onPressComida(context);
                  },
                  child: Text("Ordenar",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                  color: Colors.white,
                  disabledTextColor: Colors.redAccent,
                  textColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromRGBO(248, 64, 0, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

Row(
  children: <Widget>[
    Text(" ")
  ],
)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







  void _onPressComida(context) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
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
                        Fluttertoast.showToast(
                            msg: "Pedido realizado con éxito",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1);
                        Navigator.pop(context);
                        
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
               )
          );
          }
          );
        });
  }







//horas
class HorasDropDown extends StatefulWidget {
  HorasDropDown() : super();
  final String title = "DropDown Demo";

  @override
  HorasDropDownState createState() => HorasDropDownState();
}
 

class Horas {
  int id;
  String hora;
 
  Horas(this.id, this.hora);
  static List<Horas> getHoras() {
    return <Horas>[
      Horas(2, '07:55-08:50'),
      Horas(3, '08:50-09:45'),
      Horas(4, '09:45-10:40'),
      Horas(5, '10:40-11:35'),
      Horas(6, '11:35-12:30'),
      Horas(7, '12:30-13:25'),
      Horas(8, '13:25-14:20'),
      Horas(9, '14:20-15:15'),
      Horas(10, '15:15-16:10'),
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






