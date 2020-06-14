import 'dart:convert';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/foodPage.dart';

import '../../../../datos/requests.dart';

Future<List<GuisosDatos>> getGuisosList(String idG) async {
  Map<String,String> body = {
    'cafe':'$idG'
  };
  String response = await executeHttpRequest(urlFile: "/obtenerGuisos.php", requestBody: body);
  print("getGuisosList($idG) $response");
  final decodedData = json.decode(response);

  final List<GuisosDatos> tripsList = [];
  for(var item in decodedData['guiso']){
    tripsList.add(GuisosDatos(item['idGuiso'],item['nombreGuiso']));
    // print(item['nombreGuiso']);
  }
  // print("cantidad: ${tripsList.length}");
  return tripsList;
}