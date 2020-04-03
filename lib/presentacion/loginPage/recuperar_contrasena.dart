import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'loginLogic.dart';

 
class RecuperarContrasena extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 64, 0, 1),
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
             


             Container(
               width: 500,
               height: 300,

               child: Stack(
                 children: <Widget>[



                   
	                  Positioned(
	                    left: 180,
	                    width: 350,
	                    height: 250,
	                    child: FadeAnimation(.1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/logoRecuperar.png')
	                        )
	                      ),
	                    )),
	                  ),


                   Positioned(
                      top: 180,
                      width: 195,
                      child: FadeAnimation(.6, Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text("Recuperar",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          ),
                        ),
                        ),
                      ),
                   ),


                   Positioned(
                      top: 200,
                      width: 310,
                      child: FadeAnimation(1.2, Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text("Contraseña",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        ),
                      ),
                   ),


                   Positioned(
                      top: 260,
                      width: 300,
                      child: FadeAnimation(1.4, Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text("Su contraseña se enviara al siguiente correo:",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          ),
                        ),
                        ),
                      ),
                   ),


                  ],
               ),
             ),


             



             Padding(
	              padding: EdgeInsets.all(20.0),
	              child: Column(
	                children: <Widget>[




	            Padding(
	              padding: EdgeInsets.all(20.0),
	              child: Column(
	                children: <Widget>[





	                  FadeAnimation(1, Container(
                      width: 500,
                      height: 85,
	                    padding: EdgeInsets.all(10),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(35),

	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(100, 100, 0, .3),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 5)
	                        )
	                      ]

	                    ),
	                    child: Column(
	                      children: <Widget>[


	                        Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              controller: emailController,
                              textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Correo Institucional",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 20,
                                  )
	                            ),
	                          ),
	                        ),




	                      ],
	                    ),
	                  )),





                    //**Boton Recuperar* */
                   Padding(
                  padding: EdgeInsets.only(top: 270),
                  child: MaterialButton(
                    onPressed: () {
                      restorePassword(emailController.text);
                    },
                    child: Text(
                      'Recuperar',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 64, 0, 1),
                          ),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    minWidth: 250,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                        






               






                
	                ],
	              ),
	            )



                
                


                  ]
                )
              )




               



            ],
          ),





        ),
      ),



      );
  }
}



