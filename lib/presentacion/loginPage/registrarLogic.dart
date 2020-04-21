import 'package:firebase_auth/firebase_auth.dart';
import 'package:kfood_app/datos/requests.dart';

Future<String> signIn(String email, String nombre, String ape_pat, String ape_mat, String carrera, String matricula, String semestre, String pass) async {
  String response = "exito";
  //Crear usuario en firebase
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);

  }catch(error){
    print(error.message);
    switch(error.message){
      case 'The email address is already in use by another account.':
        print("El correo ya esta en uso");
        response = "existente";
        break;
      case 'The email address is badly formatted.':
        print("Error de formato");
        response = "mal formato";
        break;
      default:
        response = "error";
        break;

    }
  }

  if(response == "exito"){
    response = await uploadToMysql(email, nombre, ape_pat, ape_mat, carrera, matricula, semestre);
  }
  return response;
}

Future<String> uploadToMysql(String email, String nombre, String ape_pat, String ape_mat, String carrera, String matricula, String semestre) async{
  Map<String,String> body = {
    'email':'$email',
    'nombre':'$nombre',
    'ape_pat':'$ape_pat',
    'ape_mat':'$ape_mat',
    'carrera':'$carrera',
    'matricula':'$matricula',
    'semestre':'$semestre',
  };

  String response = await executeHttpRequest(urlFile: "/registro.php", requestBody: body);
  return response;
}