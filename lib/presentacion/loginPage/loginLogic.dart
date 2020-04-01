import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

Future<bool> logIn(String user, String pass) async {
  bool respuesta = false;
  //getData();
  List<Map<String,dynamic>> completeDB = await getUsersList();
  print(completeDB.length);
  //TODO: eliminar en producción
  /*completeDB.forEach((element){
    element.forEach((key, value){
      print("$key:$value");
    });
  });*/
  if(checkUser(completeDB, user, pass)){
    respuesta = true;
    print("Login exitoso");
  }

  print("$user -- $pass");
  return respuesta;
}

bool checkUser(List<Map<String,dynamic>> completeDB, String user, String pass){
  bool respuesta = false;
  for (var i = 0; i<completeDB.length; i++){
    if(completeDB[i]["matricula"] == user){
      print("Existe el usuario");
      if(checkPass(completeDB, pass, i)){
        print("y su contraseña es correcta");
        respuesta = true;
      }
      break;
    }else{
      print("Error");
    }
  }
  return respuesta;
}

bool checkPass(List<Map<String,dynamic>> completeDB, String pass, int index){
  bool respuesta = false;
  if(completeDB[index]["contraseña"] == pass){
    print("Exito");
    respuesta = true;
  }else{
    print("Error");
  }
  return respuesta;
}

//Formatea la respuesta de Firebase a algo que jsonDecoder pueda comprender
String textFormarter(String s){
  int lastCharacter = 0;
  int lastSpace = -1;
  int index = -1;
  int characterNumber = 0;
  int lastSeparator = -1;
  s.runes.forEach((int rune){
    index++;
    var char = new String.fromCharCode(rune);
    if(char!=' ' && char!=':' && char!=',' && char!='}' && char != '{'){
      characterNumber++;

      lastCharacter=index;
      if(characterNumber==1){
        s = s.replaceRange(0, 1, "${s[0]}\"");
        index++;
        lastCharacter++;

      }
      if(lastSpace==index-1 && lastSeparator==index-2){
        s = s.replaceRange(lastSpace, lastSpace+1, "${s[lastSpace]}\"");
        index++;
        lastCharacter++;
        lastSpace++;
        lastSeparator++;
      }
    }else if(char==':' || char==',' || char=='}'){
      s = s.replaceRange(lastCharacter, lastCharacter+1, "${s[lastCharacter]}\"");
      index++;
      lastSeparator=index;
      lastCharacter++;
      lastSpace++;
    }else if(char==' '){
      lastSpace=index;
    }
  });
  print(s);
  return s;
}

//Todo: Eliminar cuando este terminada la implementación
getData(){
  FirebaseDatabase.instance
      .reference()
      .child("usuarios")
      .child("1")
      .once()
      .then((DataSnapshot ds){
    print(ds.value['matricula']);
    print(ds.value['contraseña']);
  });
}

Future<List> getUsersList() async{
  List<Map<String,dynamic>> completeDB = new List();
  var db = FirebaseDatabase.instance.reference().child("usuarios");
  await db.once().then((DataSnapshot ds){
    List<dynamic> values = ds.value;
    values.forEach((key){
      if(key!=null){
        print("<--$key-->");
        String formated = textFormarter("$key");
        Map<String, dynamic> data = jsonDecode(formated);
        completeDB.add(data);
      }
    });
  });
  return completeDB;
}
