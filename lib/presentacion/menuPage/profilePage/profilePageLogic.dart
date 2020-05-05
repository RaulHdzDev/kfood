import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kfood_app/presentacion/menuPage/profilePage/datos_Profile.dart';

import '../../../datos/requests.dart';

Future<List<DatosProfile>> getProfileData() async {
  var user = await FirebaseAuth.instance.currentUser();
  String email = user.email;
  Map<String,String> body = {
    'email':'$email'
  };
  String response = await executeHttpRequest(urlFile: "/perfil.php", requestBody: body);
  print(response);
  final decodedData = json.decode(response);
  print(decodedData);
  final List<DatosProfile> tripsList = [];
  tripsList.add(DatosProfile(decodedData['id_usuarios'], decodedData['matricula'], decodedData['nombre'],decodedData['ape_pat'],decodedData['ape_mat'],decodedData['email']));
  print(decodedData['matricula']);
  print("cantidad: ${tripsList.length}");
  return tripsList;
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