// lib/controllers/api_controller.dart
import 'package:flutter_frontend/app/data/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../app/data/model/category_model.dart';

class ApiController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = true.obs;

  // GET
  Future<void> fetchCategories() async {
    isLoading.value = true;
    final url = Uri.parse('http://127.0.0.1:3000/category');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        categories.value = data.map((json) => Category.fromJson(json)).toList();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // POST
  Future<void> addCategory(int id, String name) async {
    final url = Uri.parse('http://127.0.0.1:3000/category');
    final body = json.encode(Category(id: id, name: name).toJson());

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.statusCode == 200) {
        print("Data berhasil ditambahkan");
        fetchCategories();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
