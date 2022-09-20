import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {

  Future<UserModel?> login(String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password
      };

      var response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/login'),
        body: body,
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final data = UserModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        return data;
      } else {
        return null;
      }

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> register(String email, String password, String name, String goal) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };

      var response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/register'),
        body: body,
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final data = UserModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        return data;
      } else {
        return null;
      }

    } catch (e) {
      print(e);
      return null;
    }
  }
}