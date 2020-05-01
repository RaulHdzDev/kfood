import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';
 
     


class ProfilePage extends StatefulWidget {
  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<ProfilePage> {
 
@override
  Widget build(BuildContext context) {
      return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
        elevation: 10,
        title: Text("Perfil"),
        backgroundColor: Color.fromRGBO(248, 64, 0, 1),
        automaticallyImplyLeading: false,
      ),
      
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
                 image: DecorationImage(image: AssetImage('assets/images/backHome.png'),
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
                    horizontal: 35.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       _pedidos(),
                       SizedBox(height: 20.0),
                      _datos(),
                      SizedBox(
                        height: 20.0,
                      ),        
                      _editar(context),
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



Widget _pedidos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ 
        Row( 
          children: <Widget>[  
             Text("Matricula:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay"),),
            SizedBox(height: 4,),
            Text("1701F0163" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay") ),
            SizedBox(height: 16,),
          ],
        ),

         SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[ 
             Text("Pedidos:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay"),),
            SizedBox(height: 4,),
            Text("45" ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay") ),
            SizedBox(height: 16,),
              ],
            ),
         SizedBox(height: 16,),
             Row(
          children: <Widget>[
            Column(
              children: <Widget>[
             Text("Comida favorita:", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
            SizedBox(height: 4,),
            Text("Hamburguesa",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay") ),
            SizedBox(height: 16,),
              ],
            )
          ],
        ),

        SizedBox(height: 16,),
             Row(
          children: <Widget>[
            Column(
              children: <Widget>[
             Text("Tienda favorita:", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay")),
            SizedBox(height: 4,),
            Text("Dulce como la miel",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay")),
            SizedBox(height: 16,),
              ],
            )
          ],
        ),

          ],
        ),
            Divider(color: Colors.grey)
      ],
    );
  }



 

  Widget _datos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        
            Text("Nombre:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay")),
            SizedBox(height: 4,),
            Text("Jesus Emmanuel De Leon Lerma",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay")),
            SizedBox(height: 16),


            Text("Correo:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay")),
            SizedBox(height: 4,),
            Text("deleon.lerma.17163@itsmante.edu.mx",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay")),
            SizedBox(height: 16,),

            Text("Contraseña:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "SFUIDisplay")),
            SizedBox(height: 4,),
            Text("***********",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "SFUIDisplay")),
            SizedBox(height: 16,),

          
            Divider(color: Colors.grey,)

      ],
    );
  }



    Widget _nombre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontFamily: "SFUIDisplay",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Su nombre es',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }




  
  Widget _correo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Correo:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
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
              hintText: 'Su correo es',
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
          'Contraseña:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
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
              hintText: 'Su contraseña es',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
 
 

  Widget _editar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
       width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
           _abrirActualizar();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
         color: Color.fromRGBO(248, 64, 0, 1),
        child: Text(
          'Editar',
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


 
 

Widget _guardar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
       width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
            Fluttertoast.showToast(
                            msg: "Se guardo correctamente",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1);
                            
         },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
         color: Color.fromRGBO(248, 64, 0, 1),
        child: Text(
          'Guardar',
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




  void _abrirActualizar( ) {
    showBottomSheet(
      context: context,
         builder: (context) {
          return Container( 
             alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-100,
             padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 30.0,
                  ),
            child: SingleChildScrollView(
              child: Column(
               children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 20),
                  child: Container(
                    child: Text(
                      "Editar información",
                      style: TextStyle(
                        color: Color.fromRGBO(248, 64, 0, 1),
                        letterSpacing: 1.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                _correo(),
                 SizedBox(width: 20,),
                _contrasena(),
                 SizedBox(
                  width: 20,
                ),
                    _guardar(context)
              ],
            ),
            ),
          );
        });
  }


}

