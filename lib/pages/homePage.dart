import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
           image: AssetImage('assets/images/backHome.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 75,),
                Container(
            height: 125.0,
            width: 125.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.scaleDown),
              
           ),
          ),
          SizedBox(height: 100,),
                Form(
                  child: Column(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent
                              )
                            ),
                            labelText: 'Nombre de usuario',
                            labelStyle: TextStyle(fontSize: 15,
                            color: Colors.redAccent)
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                          style: TextStyle(
                            color: Colors.redAccent
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent
                              )
                            ),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(fontSize: 15,
                            color: Colors.redAccent)
                          ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 5),
                  child: 
                  RichText(
                    textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [

                          TextSpan(
                            text: "¿Olvidaste tu contraseña?.",
                            style: TextStyle(
                               fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontSize: 15,
                            )
                          ),
                          TextSpan(
                            text: "Clic aqui.",
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Color(0xffff2d55),
                              fontSize: 15,
                            )
                          )
                        ]
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: (){},
                    child: Text('INICIAR SESIÓN',
                    style: TextStyle(
                      fontSize: 15,
                       fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    color: Color(0xffff2d55),
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('REGISTRATE AHORA',
                        style: TextStyle(
                          fontSize: 15,
                           fontFamily: 'SFUIDisplay'
                        ),)
                      ],
                    ),
                    color: Colors.white,
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    textColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.redAccent, width: 2.0),

                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 30),
                //   child: Center(
                //     child: RichText(
                //       text: TextSpan(
                //         children: [
                //           TextSpan(
                //             text: "Don't have an account?",
                //             style: TextStyle(
                //               // fontFamily: 'SFUIDisplay',
                //               color: Colors.black,
                //               fontSize: 15,
                //             )
                //           ),
                //           TextSpan(
                //             text: "sign up",
                //             style: TextStyle(
                //               // fontFamily: 'SFUIDisplay',
                //               color: Color(0xffff2d55),
                //               fontSize: 15,
                //             )
                //           )
                //         ]
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}