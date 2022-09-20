import 'package:flutter/material.dart';
import 'package:jobs_hunting/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }
}