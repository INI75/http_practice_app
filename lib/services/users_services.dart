import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_practice_app/models/user_model.dart';

class UserServices {
  static const urlOrigin = 'https://jsonplaceholder.typicode.com/users';
  final client = http.Client();

// get all users
  Future<List<User>> fetchUsersFromEndPoint() async {

    final responce = await client.get(Uri.parse(urlOrigin));

    if (responce.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(responce.body);
      List<User> usersData = jsonData.map((e) => User.fromJson(e)).toList();
      return usersData;
    }
    return [];
  }

  // get specific data from eac users api docs

  Future<User?> fetchUserDetail({String? api}) async {
    String section = api ?? '';
    final responce = await client.get(Uri.parse(urlOrigin + section));

    if (responce.statusCode == 200) {
      final jsonData = jsonDecode(responce.body);
      User userData = User.fromJson(jsonData);
      return userData;
    }

    return null;
  }

  // post

  // delete
}
