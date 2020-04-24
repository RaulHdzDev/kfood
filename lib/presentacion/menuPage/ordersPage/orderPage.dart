import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';
import 'package:kfood_app/presentacion/menuPage/menu_principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';



class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);



@override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/images/perfilSesion.png'),
                   fit: BoxFit.cover),
                     gradient: LinearGradient(
                    begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                    colors: [Colors.white, Colors.white]
                       ),
        ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 90.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Orden',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 90.0),
        
                      SizedBox(
                        height: 20.0,
                      ),
              
                      SizedBox(
                        height: 20.0,
                      ),
              
     
           
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  
 
}

