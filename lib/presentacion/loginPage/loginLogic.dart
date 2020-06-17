import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../datos/requests.dart';

Future<bool> logIn(String user, String pass) async {
  bool response = await existUser();
  if(! response){
    try{
      String email = await getEmailFromMysql(user);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass);
      response = await existUser();
    } catch (error) {
      print(error.message);
      switch (error.message){
        case 'The password is invalid or the user does not have a password.':
          print("Contraseña erronea");
          break;
      }
    }
  }
  return response;
}

Future<String> getEmailFromMysql(String matricula) async {
  print("Inicio la funcion getEmailFromMysql(String matricula=$matricula)");
  Map<String,String> body = {
    'matricula':'$matricula'
  };
  String response = await executeHttpRequest(urlFile: "/getEmailMatricula.php", requestBody: body);
  print("el server respondio: $response");
  final decodedData = json.decode(response);
  String responseValue = decodedData['email'];
  print(responseValue);
  return responseValue;
}

Future<bool> existUser() async {
  bool response = false;
  var user = await FirebaseAuth.instance.currentUser();
  if(user != null){
    print("Usuario existe ${user.email}");
    response = true;
  }else{
    print("No existe usuario");
  }
  return response;
}

logOut() async {
  await FirebaseAuth.instance.signOut();
}

restorePassword(String email) async {
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }catch(error){
    print(error.message);
    switch (error.message){
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        print("No existe el usuario");
        break;
    }
  }

}

Future<String> getUserID() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  Map<String,String> body = {
    'correo':'${user.email}'
  };
  return await executeHttpRequest(urlFile: "/getUserID.php", requestBody: body);
}

updateToken() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = await _firebaseMessaging.getToken();
  String id = await getUserID();
  Map<String, String> body = {
    'id':'$id',
    'token':'$token'
  };
  executeHttpRequest(urlFile: "/updateToken.php", requestBody: body).then((respuesta){
    print("updateToken.php respondio: $respuesta, cuando id=$id al actualizar token:$token");
  });
}
