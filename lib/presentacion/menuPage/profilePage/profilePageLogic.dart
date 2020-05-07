import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/datos_Profile.dart';

import '../../../datos/requests.dart';

Future<DatosProfile> getProfileData() async {
  var user = await FirebaseAuth.instance.currentUser();
  String email = user.email;
  Map<String,String> body = {
    'email':'$email'
  };
  String response = await executeHttpRequest(urlFile: "/perfil.php", requestBody: body);
  final decodedData = json.decode(response);
  return DatosProfile(decodedData['id_usuarios'], decodedData['matricula'], decodedData['nombre'],decodedData['ape_pat'],decodedData['ape_mat'],decodedData['email']);
}

Future<DatosActivity> getProfileActivity() async {
  print("iniciando getProfileActivity()");
  var user = await FirebaseAuth.instance.currentUser();
  String email = user.email;
  Map<String,String> body = {
    'email':'$email'
  };
  String response = await executeHttpRequest(urlFile: "/perfilActividad.php", requestBody: body);
  String response2 = await executeHttpRequest(urlFile: "/pedidos.php", requestBody: body);
  print("Respuesta del server: $response");
  print("Respuesta del server: $response2");
  final decodedData = json.decode(response);
  final decodedData2 = json.decode(response2);
  String platillo = decodedData['nombre_comida'];
  if(decodedData['nombre_comida']==null){
    print("platillo es null");
    platillo = "_";
  }
  DatosActivity datos = DatosActivity(decodedData2['pedidos'], platillo);
  print("pedidos=${datos.pedidos} y plato=${datos.plato}");
  return datos;
}

updateDatos(String newPass, String newEmail){
  if(newPass.length>0) updatePassword(newPass);
  if(newEmail.length>4) {
    print("Starting with value $newEmail");
    updateEmail(newEmail);
  }
}

updatePassword(String newPass) async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  user.updatePassword(newPass);
}

updateEmail(String newEmail) async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  user.updateEmail(newEmail);
  await updateEmailonMysql(newEmail);
}

updateEmailonMysql(String newEmail) async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  Map<String,String> body = {
    'emailOld':'${user.email}',
    'emailNew':'$newEmail'
  };
  String response = await executeHttpRequest(urlFile: "/updateEmail.php", requestBody: body);
  print(response);
}