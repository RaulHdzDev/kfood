import 'package:kfood_app/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Registrar extends StatefulWidget {
  Registrar({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Registrar> {
 

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,


        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromRGBO(248, 64, 0, 1),
          Color.fromRGBO(248, 64, 0, .8),
          Color.fromRGBO(248, 64, 0, .7)
        ])),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),



            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  
                  FadeAnimation(1,
                      Text(
                        "Bienvenido",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SFUIDisplay',
                            fontSize: 40),
                      )),
                


                  FadeAnimation(
                      1.3,
                      Text(
                        "Registrar usuarios           ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFUIDisplay',
                            fontSize: 18),
                      )),
                ],
              ),
            ),

 

            SizedBox(height: 20),
            Expanded(
              child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),



                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),


                          FadeAnimation(
                              1.4,
                              Container(
                                child: Column(
                                  children: <Widget>[



                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Nombre",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),



                                    SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Apellido paterno",                                    
                                        labelStyle: TextStyle(
                                           fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),


                                    
                                    SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Apellido materno",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),



                                    SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Matricula",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),

                                    SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Semestre",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),



                                     SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Carrera",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),


                                    
                                    SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Correo institucional",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),


                                      SizedBox( height: 10),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      autofocus: true,
                                      textAlign: TextAlign.left,
                                      autocorrect: true,
                                      cursorColor:  Colors.black,
                                      cursorRadius: Radius.circular(10),
                                      decoration: InputDecoration(
                                        labelText: "Contraseña",                                    
                                        labelStyle: TextStyle(
                                            fontFamily: 'SFUIDisplay',
                                            fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        hintStyle:
                                            TextStyle(color: Color.fromRGBO(248, 64, 0, 1)),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                    ),






                                  ],
                                ),
                              )),



                          SizedBox(
                            height: 10,
                          ),




              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {
                    
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
                      side: BorderSide(color: Color.fromRGBO(248, 64, 0, 1), width: 2.0),
                    ),
                  ),
                ),





                        ],
                      ),
                    ),
                  )),


            )
          ],
        ),
      ),
    );

  }
}
