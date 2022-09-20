import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobs_hunting/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier{
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    try {

      var response = await http.get(Uri.parse('https://bwa-jobs.herokuapp.com/categories'));

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }

    } catch(e){
      print(e);
      return [];
    }
  }
}