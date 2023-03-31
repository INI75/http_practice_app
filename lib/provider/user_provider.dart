import 'package:flutter/material.dart';
import 'package:http_practice_app/helpers/connectivity.dart';
import 'package:http_practice_app/models/user_model.dart';
import 'package:http_practice_app/services/users_services.dart';

class UsersProvider extends ChangeNotifier {
  final services = UserServices();
  List<User> _usersList = [];
  List<User> get list => [..._usersList];
  final a = NetworkConnectivity();

  Future<void> get users async {
    if (await NetworkConnectivity.checkStatus()) {
      _usersList = await services.fetchUsersFromEndPoint();
      notifyListeners();
    } else {
     // how to use context with provider
       
    }
  }

  Future<User?> userDetail(String section) async {
    User? userDetail = await services.fetchUserDetail(api: section);

    notifyListeners();
    return userDetail;
  }
}
