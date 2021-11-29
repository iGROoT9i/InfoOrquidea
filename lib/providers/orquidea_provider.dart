import 'dart:convert';

import 'package:http/http.dart' as http;

// import 'package:formvalidation/src/models/producto_model.dart';
import 'package:shop_app/models/orquidea.dart';

class OrquideaProvider {
  final String _url = 'https://infoquidea-default-rtdb.firebaseio.com';
// https://infoquidea-default-rtdb.firebaseio.com/
  Future<bool> crearOrquidea(OrquideaModel orquidea) async {
    final url = '$_url/orquidea.json';

    // var url =
    //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    // var response = await http.get(url);
    // Await the http get response, then decode the json-formatted response.

    final resp = await http.post(url, body: productoModelToJson(orquidea));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarOrquidea(OrquideaModel orquidea) async {
    final url = '$_url/orquidea/${orquidea.id}.json';

    final resp = await http.put(url, body: productoModelToJson(orquidea));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<OrquideaModel>> cargarOrquidea() async {
    final url = '$_url/orquidea.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<OrquideaModel> orquidea = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, vivr) {
      final prodTemp = OrquideaModel.fromJson(vivr);
      prodTemp.id = id;

      orquidea.add(prodTemp);
    });

    // print( productos[0].id );

    return orquidea;
  }

  Future<int> borrarOrquidea(String id) async {
    final url = '$_url/orquidea/$id.json';

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
