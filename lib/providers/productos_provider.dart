import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';

// import 'package:formvalidation/src/models/producto_model.dart';
import 'package:shop_app/models/viveros.dart';

class ViveroProvider {
  final String _url = 'https://infoquidea-default-rtdb.firebaseio.com';
// https://infoquidea-default-rtdb.firebaseio.com/
  Future<bool> crearVivero(ViveroModel vivero) async {
    final url = '$_url/vivero.json';

    // var url =
    //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    // var response = await http.get(url);
    // Await the http get response, then decode the json-formatted response.

    final resp = await http.post(url, body: productoModelToJson(vivero));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarProducto(ViveroModel vivero) async {
    final url = '$_url/vivero/${vivero.id}.json';

    final resp = await http.put(url, body: productoModelToJson(vivero));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ViveroModel>> cargarVivero() async {
    final url = '$_url/vivero.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ViveroModel> vivero = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, vivr) {
      final prodTemp = ViveroModel.fromJson(vivr);
      prodTemp.id = id;

      vivero.add(prodTemp);
    });

    // print( productos[0].id );

    return vivero;
  }

  Future<int> borrarVivero(String id) async {
    final url = '$_url/vivero/$id.json';

    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }

  // Future<String> subirImagen(File imagen) async {
  //   final url = Uri.parse(
  //       'https://api.cloudinary.com/v1_1/dc0tufkzf/image/upload?upload_preset=cwye3brj');
  //   final mimeType = mime(imagen.path)?.split('/'); //image/jpeg

  //   final imageUploadRequest = http.MultipartRequest('POST', url);

  //   final file = await http.MultipartFile.fromPath('file', imagen.path,
  //       contentType: MediaType(mimeType[0], mimeType[1]));

  //   imageUploadRequest.files.add(file);

  //   final streamResponse = await imageUploadRequest.send();
  //   final resp = await http.Response.fromStream(streamResponse);

  //   if (resp.statusCode != 200 && resp.statusCode != 201) {
  //     print('Algo salio mal');
  //     print(resp.body);
  //     return null;
  //   }

  //   final respData = json.decode(resp.body);
  //   print(respData);

  //   return respData['secure_url'];
  // }
}
