import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:TodoApp/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class TodoService {
  static final baseUrl = dotenv.env['API_URL'];
  static final storage = FlutterSecureStorage();
  static final c = Get.put(HomePageController());

  static Future<Map<String, String>> _getHeaders() async {
    final token = await storage.read(key: "token");
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static Future<dynamic> createTodo(String description) async {
    final headers = await _getHeaders();

    final response = await http.post(
      Uri.parse("$baseUrl/todo/create"),
      headers: headers,
      body: jsonEncode({
        'body': description,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
     return false;
    }
  }

  static Future<List<dynamic>> getTodos() async {
    final headers = await _getHeaders();

    final response = await http.get(
      Uri.parse("$baseUrl/todo/get_all"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final todos = jsonDecode(response.body);
      return todos;
    } else {
      print("Fetch failed: ${response.statusCode}");
      return [];
    }
  }


  static Future<dynamic> updateTodo(int id,String description) async {
    final headers = await _getHeaders();

    final response = await http.put(
      Uri.parse("$baseUrl/todo/update?id=$id"),
      headers: headers,
      body: jsonEncode({
        'body': description,
      }),
    );

    if (response.statusCode == 202) {
      return true;
    } else {
      return false;
    }
  }


  static Future<dynamic> removeTodo(int id) async {
    final headers = await _getHeaders();

    final response = await http.delete(
      Uri.parse("$baseUrl/todo/remove?id=$id"),
      headers: headers,
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
