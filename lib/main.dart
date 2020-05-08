import 'package:flutter/material.dart';
import 'package:kfood_app/negocios/class/pedComGui.dart';
import 'package:kfood_app/negocios/pedidosIncompletos.dart';
import 'package:kfood_app/negocios/providers/carritoIncompleto.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';
import 'package:kfood_app/negocios/providers/contCantidad.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';
import 'package:kfood_app/presentacion/bienvenida/p_bienvenida1.dart';
import 'package:kfood_app/presentacion/loginPage/loginLogic.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';
import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'dart:async';

import 'package:kfood_app/presentacion/menuPage/menu_principal.dart';
import 'package:kfood_app/presentacion/menuPage/ordersPage/models/orderItems.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePageLogic.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => Comidas(),),
        ChangeNotifierProvider(builder: (context) => ContCantidad(),),
        ChangeNotifierProvider(builder: (context) => Ordenes(),),
        ChangeNotifierProvider(builder: (context) => CarritoIncompleto(),),
      ],
          child: MaterialApp(
        home: Scaffold(
        body: Splash(),
      ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}



class Splash extends StatefulWidget {
  @override
  SplashScreen createState() => SplashScreen();
}


class SplashScreen extends State<Splash> {

    
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () async {
        if(! await existUser()){
          Navigator.pushReplacement(
            this.context,
            MaterialPageRoute(
              builder: (context) => Presentacion1(),
              //builder: (context) => HomePage(),
            ),
          );
        }else{
          _agregarPedInicial(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context)=> MenuPrincipal(),
              //builder: (context)=> MenuPrincipal(),
            )
          );
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
//
      
//      
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container( 

	        child: Column(
          
	          children: <Widget>[
	            Container(
	              child: Stack(
	                children: <Widget>[


                    Container(
                      width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(222, 57, 0, 1),
                            Color.fromRGBO(255, 123, 54, 1),
                            ],
                          )
                      ),
                    ),


                  Positioned(
                    width: 130,
                    bottom: 300,
                    left: 130,
                    top: 300,
                    
	                    child: FadeAnimation(.1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/logoSplash.png'),                     
	                        )
	                      ),         
	                    )

                      ),
	                  ),


                    
                  Positioned(
                    width: 130,
                    bottom: 300,
                    left: 130,
                    top: 470,
                    
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/nombreSplash.png'),                     
	                        )
	                      ),         
	                    )

                      ),
	                  ),


	                ],
	              ),
	            ),


	          ],
	        ),
	      ),
      )
    );
  }
  
  _agregarPedInicial(BuildContext context){
    Ordenes carrito;
    carrito = Provider.of<Ordenes>(context);
    getProfileData().then((value){
      MismoPedido.idusuario = value.id_usuarios;
      obtenerPedidosIncompletos(MismoPedido.idusuario, carrito);
    });
  }
   
}
