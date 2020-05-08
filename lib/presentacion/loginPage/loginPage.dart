import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';

import '../menuPage/menu_principal.dart';
import 'loginLogic.dart';
import 'recuperar_contrasena.dart';
import 'registrar.dart';

class HomePage extends StatefulWidget {
  @override
  Login createState() => Login();
}

class Login extends State<HomePage> {
  bool _rememberMe = false;
  final userController = TextEditingController();
  final passwordController = TextEditingController();

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
                  image: DecorationImage(
                      image: AssetImage('assets/images/backHome.png'),
                      fit: BoxFit.cover),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white, Colors.white]),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 90.0),
                      _matricula(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _contrasena(),
                      _recuperarcontra(),
                      _recuerdame(),
                      _iniciarsesion(),
                      // _botonesredessociales(),
                      _crearcuenta(),
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

  Widget _matricula() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Matricula',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: userController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Ingrese su matricula',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _contrasena() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Ingrese su contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _recuperarcontra() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => RecuperarContrasena(),
              ));
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _recuerdame() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Recordar contraseña',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _iniciarsesion() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          Fluttertoast.showToast(
            msg: "Comprobando...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
          if (await logIn(userController.text, passwordController.text)) {
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => MenuPrincipal(),
                ));
            Fluttertoast.showToast(
              msg: "Bienvenido :D",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
            );
          } else {
            Fluttertoast.showToast(
              msg: "Usuario/Contraseña incorrecta",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
            );
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color.fromRGBO(248, 64, 0, 1),
        child: Text(
          'INICIAR SESIÓN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _crearcuenta() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Registrar(),
            ));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrate aquí',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ESTE ES EL CODIGO ANTERIOR DE LOGIN

/*
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
                    onPressed: () async { /*COmente lo siguiente debido a que no me dejaba iniciar sesion */
                      if(await logIn(usernameController.text,passwordController.text)){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context)=> MenuPrincipal(),
                      )

                      );
                      }
                      },
                      
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


*/
