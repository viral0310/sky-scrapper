import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

//singleton class
class APIHelper {
  //1. create a private named constructor

  APIHelper._();

//2. create an object with the reference of private named constructor
  static final APIHelper apiHelper = APIHelper._();

  String BASE_URL =
      'https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true';

  // dynamic total = BASE_URL + ENDPOINT;

  Future<List<Model>?> fetchMultiplePostData() async {
    http.Response res = await http.get(Uri.parse(BASE_URL));

    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      List<Model> posts =
          decodedData.map((e) => Model.fromJson(json: e)).toList();
      return posts;
    }
    return null;
  }
}
