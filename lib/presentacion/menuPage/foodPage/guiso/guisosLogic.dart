import 'dart:convert';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/foodPage.dart';

import '../../../../datos/requests.dart';

Future<List<GuisosDatos>> getGuisosList() async {
  String response = await executeHttpRequest(urlFile: "/obtenerGuisos.php", requestBody: null);
  final decodedData = json.decode(response);
  // print(decodedData);
  final List<GuisosDatos> tripsList = [];
  for(var item in decodedData['guiso']){
    tripsList.add(GuisosDatos(item['idGuiso'],item['nombreGuiso']));
    // print(item['nombreGuiso']);
  }
  // print("cantidad: ${tripsList.length}");
  return tripsList;
}