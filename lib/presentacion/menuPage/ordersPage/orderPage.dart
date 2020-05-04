import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/models/orderItems.dart';

class OrderPage extends StatelessWidget{
  
  List<OrderItems> orderItems = [];

  Ordenes ordenes;
  
  getOrders(){
    List<OrderItems> ordenitem = new List<OrderItems>();
    for (EsqueletoOrdenes orden in ordenes.ordenes) {
      ordenitem.add(new OrderItems(number: orden.cantidad.toString(), text: orden.nombre, secondaryText: orden.guiso, amount: orden.total.toString()));
    }
    return ordenitem;
  }

  @override
  Widget build(BuildContext context) {
    ordenes = Provider.of<Ordenes>(context);
    orderItems = getOrders();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        title: Text("Orden"),
        backgroundColor: Color.fromRGBO(248, 64, 0, 1),
        automaticallyImplyLeading: false,
      ),


      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   SizedBox(height: 10,),         
                   Text("Lista de",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                  SizedBox(height: 0,),
                  Text("comidas",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20)),
                  SizedBox(height: 10,),
                 SizedBox(height: 10,),  
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
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: (){},
                  child: Text("Ordenar",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.normal),),
                  color: Color.fromRGBO(248, 64, 0, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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