import 'package:kfood_app/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:kfood_app/presentacion/loginPage/recuperar_contrasena.dart';


class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(


      	child: Container(
	        child: Column(
          
	          children: <Widget>[



	            Container(
	              height: 195,

                
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/fondoKfood.png'),
	                  fit: BoxFit.fill
	                )
	              ),



	              child: Stack(
	                children: <Widget>[



	                  Positioned(
	                    left: 20,
	                    width: 80,
                      top: -80,
	                    height: 200,
	                    child: FadeAnimation(.4, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),





	                  Positioned(
	                    left: 140,
	                    width: 50,
	                    height: 150,
	                    child: FadeAnimation(.8, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),





	                  Positioned(
	                    right: 150,
	                    top: 50,
	                    child: FadeAnimation(1.2, Container(
	                    margin: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text("Registrar", style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      )),
	                  ),





	                  Positioned(
                      right: 255,
                      top: 110,
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Usuarios", style: TextStyle(
                            color: Colors.black, 
                            fontSize: 35, 
                            fontWeight: FontWeight.normal
                            ),),
	                      ),
	                    )),
	                  )



	                ],
	              ),
	            ),






	            Padding(
	              padding: EdgeInsets.all(20.0),
	              child: Column(
	                children: <Widget>[


	                  FadeAnimation(1, Container(
	                    padding: EdgeInsets.all(10),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(30),

	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(248, 64, 0, .3),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 5)
	                        )
	                      ]


	                    ),
	                    child: Column(
	                      children: <Widget>[




                  //*****Apartado para los TextField*****//
	                        Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Nombre",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),




                           Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Apellido Paterno",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),





                          Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Apellido Materno",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),




                          Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                             textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Matricula",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),




                          Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                             textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Semestre",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),





                          Container(
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                             textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Carrera",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),






                             Container( 
	                          padding: EdgeInsets.all(8),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                             textAlign: TextAlign.center,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Correo Institucional",
	                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  )
	                            ),
	                          ),
	                        ),


                        


	                      ],
	                    ),
	                  )),



               
                       Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: MaterialButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> RecuperarContrasena(),
                          )

                      );
                    },
                    
                    child: Text(
                      'Registrar',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Color.fromRGBO(248, 64, 0, 1),
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






	          ],
	        ),
	      ),
      )
    );
  }
}