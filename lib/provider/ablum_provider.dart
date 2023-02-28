import 'package:flutter/material.dart';
import 'package:http_practice_app/models/ablum_model.dart';
import 'package:http_practice_app/services/ablum_services.dart';

class AblumProvider extends ChangeNotifier {
  final baseClientService = AblumServices();

  List<Album> _ablumList = [];

  List<Album> getAlbumList() => _ablumList;

  Future<void>  get fetchAblums async {
    _ablumList = await baseClientService.fetchAbumList();
    notifyListeners();
  }
}
