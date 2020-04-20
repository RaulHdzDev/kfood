import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/loginPage/loginLogic.dart';
import 'package:kfood_app/presentacion/loginPage/recuperar_contrasena.dart';
import 'package:kfood_app/presentacion/loginPage/registrar.dart';
import 'package:kfood_app/presentacion/menuPage/menu_principal.dart';

import '../../Animation/FadeAnimation.dart';


class HomePage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/backHome.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        
        body: FadeAnimation(.5,  Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backHome.png')
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.scaleDown),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          controller: usernameController,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent)),
                              labelText: 'Matricula',
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent)),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.redAccent),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.redAccent)),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      )
                    ],
                  ),
                ),


        FlatButton(
              padding: EdgeInsets.all(0),
               onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> RecuperarContrasena(),
                          )

                      );
                    },
              child: Text(
                '¿Olvidaste tu contraseña? Clic aqui.',
                style: TextStyle(
                  color: Color.fromRGBO(248, 64, 0, 1),
                ),
                textAlign: TextAlign.right,
              ),
            ),

                



                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () /*async*/ { /*COmente lo siguiente debido a que no me dejaba iniciar sesion */
                      //if(await logIn(usernameController.text,passwordController.text)){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context)=> MenuPrincipal(),
                      )

                      );
                      },
                      //},
                      
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          ),
                    ),
                    color: Color.fromRGBO(248, 64, 0, 1),                         
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                
 

              
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> Registrar(),
                          )

                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Registrate ahora',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SFUIDisplay',fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    color: Colors.white,
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    textColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.redAccent, width: 2.0),
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
