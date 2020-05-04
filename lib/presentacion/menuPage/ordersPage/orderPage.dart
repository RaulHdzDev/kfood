import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/models/orderItems.dart';

class OrderPage extends StatelessWidget{
  List<OrderItems> orderItems = [
    OrderItems(number: "4", text: "Tacos", secondaryText: "Huevo verde", amount: "\$${28.toStringAsFixed(2)}"),
    OrderItems(number: "1", text: "Hamburguesa", secondaryText: "Chicharrón", amount: "\$${20.toStringAsFixed(2)}"),
    OrderItems(number: "1", text: "Tacos", secondaryText: "Chicharrón", amount: "\$${20.toStringAsFixed(2)}"),
    OrderItems(number: "1", text: "Gorditas", secondaryText: "Bistec", amount: "\$${20.toStringAsFixed(2)}"),
    OrderItems(number: "1", text: "Quesadillas", secondaryText: "Queso", amount: "\$${20.toStringAsFixed(2)}"),  
 ];

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
                      Text("\$25.00",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                  onPressed: (){},
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