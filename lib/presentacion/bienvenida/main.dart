import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/bienvenida/p_bienvenida1.dart';
import 'package:kfood_app/presentacion/loginPage/loginLogic.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';
import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'dart:async';

import 'package:kfood_app/presentacion/menuPage/menu_principal.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Splash(),
    ),
      debugShowCheckedModeBanner: false,
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
      Duration(seconds: 4),
      () async {
        if(! await existUser()){
          Navigator.push(
            this.context,
            MaterialPageRoute(
              builder: (context) => Presentacion1(),
              //builder: (context) => HomePage(),
            ),
          );
        }else{
          Navigator.push(
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
}
