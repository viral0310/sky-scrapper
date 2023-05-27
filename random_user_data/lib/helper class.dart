import 'dart:convert';

import 'package:random_user_data/model.dart';
import 'package:http/http.dart' as http;

class DataApiHelper {
  DataApiHelper._();

  static final DataApiHelper dataApiHelper = DataApiHelper._();

  final String BASE_URL = "https://randomuser.me/api/?results=5";
  static List<UserData> users = [];

  Future<UserData?> fetchSinglePostData() async {
    http.Response res = await http.get(Uri.parse(BASE_URL));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      UserData data = UserData.fromJson(json: decodedData);

      return data;
    }
    return null;
  }
}
