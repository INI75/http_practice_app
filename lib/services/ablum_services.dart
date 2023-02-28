import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_practice_app/models/ablum_model.dart';

class AblumServices {
  final baseUrl = 'https://jsonplaceholder.typicode.com/albums';
  final client = http.Client();

  Future<List<Album>> fetchAbumList() async {
    final responce = await client.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      final List<dynamic> jsonDate = await jsonDecode(responce.body);
      List<Album> albumData = jsonDate.map((e) => Album.fromJson(e)).toList();
      return albumData;
    }
    return [];
  }

  ///
}
