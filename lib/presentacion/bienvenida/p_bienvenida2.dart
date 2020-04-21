import 'package:flutter/material.dart';
import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'package:kfood_app/presentacion/bienvenida/p_bienvenida3.dart';



class Presentacion2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FadeAnimation(0.1,Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/imagenP2.png'),
          fit: BoxFit.cover),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white]
              ),
        ),

        child: Column(
          children: <Widget>[
            FadeAnimation(.5, Container(
              child: Column(
                children: <Widget>[

                 

                   Padding(
                  padding: EdgeInsets.only(top: 710),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> Presentacion3(),
                          )

                      );
                    },
                    child: Text(
                      'Siguiente',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 64, 0, 1),
                          ),
                    ),
                    color: Colors.white,
                    elevation: 20,
                    minWidth: 180,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),



                ],
              ),
            )
             
            )     


          ],
        ),
        
        
      ),
      ),
    );
  }
}