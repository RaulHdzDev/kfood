import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/presentacion/loginPage/utiles/constants.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/datos_Profile.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/profilePageLogic.dart';
import 'package:kfood_app/presentacion/loginPage/loginPage.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<ProfilePage> {
  ProgressDialog pr;
  String matricula = "";
  String nombre = "";
  String correo = "";
  String pedidos = "";
  String favorito = "_";
  changeText(String mat, String nom, String corr, String pedidosN, String platoFav) {
    setState(() {
      matricula = "$mat";
      nombre = "$nom";
      correo = "$corr";
      pedidos = "$pedidosN";
      favorito = "$platoFav";
    });
  }

  getProfile() async {
    print("Running");
    DatosProfile datos = await getProfileData();
    DatosActivity da = await getProfileActivity();
    changeText(
        "${datos.matricula}",
        "${datos.nombre} ${datos.apaterno} ${datos.amaterno}",
        "${datos.correo}",
        "${da.pedidos}",
        "${da.plato}"
    );
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
          message: 'Por favor espere...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, /*fontWeight: FontWeight.w400*/),
          messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            //backgroundColor: Color.fromRGBO(248, 64, 0, 1),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "TU PERFIL",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Edita tu información",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            )),
        
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hola,",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.black38,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "$nombre",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[_dashPedidos(), _dashComida()],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Divider(
                    color: Colors.black26,
                    thickness: 2,
                  ),
                ),
                _headerDatos(),
                _datoMatricula(),
                SizedBox(
                  height: 10,
                ),
                _datoCorreo(),
                SizedBox(
                  height: 10,
                ),
                _datoContrasena(),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 8),
                  child: FlatButton(
                    onPressed: () {
                      pr.show();
                      Future.delayed(Duration(seconds: 3)).then((value) {
                        pr.hide().whenComplete(() {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                        });
                      });
                      signOut();
                    },
                    padding: EdgeInsets.only(right: 0.0),
                    child: Text(
                      'S A L I R',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerDatos() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Información de tu cuenta.",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'SFUIDisplay',
              color: Colors.black38,
            ),
          ),
          FlatButton(
            onPressed: () {
              _abrirActualizar();
            },
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'Editar',
              style: kLabelStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _datoCorreo() {
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.alternate_email,
              color: Colors.black38,
              size: 25,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "$correo",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'SFUIDisplay',
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _datoContrasena() {
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.vpn_key,
              color: Colors.black38,
              size: 25,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "••••••••",
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'SFUIDisplay',
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _datoMatricula() {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.format_quote,
            color: Colors.black38,
            size: 25,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "$matricula",
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'SFUIDisplay',
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashComida() {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.green,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.fastfood,
                size: 30,
                color: Colors.white54,
              ),
              title: Text(
                "$favorito",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Comida favorita",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'SFUIDisplay',
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashPedidos() {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.redAccent,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.insert_chart,
                size: 40,
                color: Colors.white54,
              ),
              title: Text(
                "$pedidos",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "No.Pedidos",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SFUIDisplay',
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

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
            controller: emailController,
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
            controller: passController,
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

  Widget _guardar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          updateDatos(passController.text, emailController.text);
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

  void _abrirActualizar() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
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
                  SizedBox(
                    width: 20,
                  ),
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
