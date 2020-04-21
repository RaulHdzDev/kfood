import 'package:firebase_auth/firebase_auth.dart';

Future<bool> logIn(String user, String pass) async {
  bool response = false;
  if(! await existUser()){
    try{
      //Todo: implementar el login con matricula en vez de email
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user,
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

signOut() async {
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
