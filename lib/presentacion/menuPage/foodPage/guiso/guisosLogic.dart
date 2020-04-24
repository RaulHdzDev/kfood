import 'dart:convert';
import '../../../../datos/requests.dart';
import 'datos_Guisos.dart';

Future<List<DatosGuiso>> getGuisosList() async {
  String response = await executeHttpRequest(urlFile: "/obtenerGuisos.php", requestBody: null);
  final decodedData = json.decode(response);
  print(decodedData);
  final List<DatosGuiso> tripsList = [];
  for(var item in decodedData['guiso']){
    tripsList.add(DatosGuiso(item['nombreGuiso']));
    print(item['nombreGuiso']);
  }
  print("cantidad: ${tripsList.length}");
  return tripsList;
}