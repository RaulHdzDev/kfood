import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfood_app/presentacion/bienvenida/p_bienvenida3.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';
import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';


import '../menuPage/menu_principal.dart';
 




class Presentacion3 extends StatefulWidget {
  @override
  Login createState() => Login();
}



class Login extends State<Presentacion3> {
  bool _rememberMe = false;

 

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
                 image: DecorationImage(image: AssetImage('assets/images/imagenP3.png'),
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
                    horizontal: 70.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[   
                      SizedBox(height: 450.0),
                     
                      _siguiente(),
             
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




  Widget _siguiente() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: (){
          Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context)=> HomePage(),
                          )
                      );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
         color: Colors.white,
        child: Text(
          'Iniciar',
          style: TextStyle(
            color: Color.fromRGBO(248, 64, 0, 1),
            letterSpacing: 1.0,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }



}

