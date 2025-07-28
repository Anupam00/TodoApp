import 'package:TodoApp/controllers/home_page_controller.dart';
import 'package:TodoApp/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import '../views/onboarding_page.dart';

class AuthController extends GetxController {
  HomePageController get c => Get.find<HomePageController>();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final box = GetStorage();

   isValidName() {
    final valid =  c.nameController.text.trim().isNotEmpty && RegExp(r'^[A-Za-z ]+$').hasMatch(c.nameController.text);
    if(valid){
      return c.nameController.text;
    }else{
      Get.snackbar("Alert","Incorrect Name Format");
      return null;
    }
  }

   isValidEmail() {
    final valid =  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(c.emailController.text);
    if(valid){
      return c.emailController.text;
    }else{
      Get.snackbar("Alert","Incorrect Email Format");
      return null;
    }
  }

  isValidPassword() {
    final valid = c.passwordController.text.length >= 6;
    if(valid){
      return c.passwordController.text;
    }else{
      Get.snackbar("Alert","Password length must be more than 6");
      return null;
    }
  }

  var isLoading = false.obs;

  Future <void> register() async {
    if (isLoading.value) return; // Avoid double submit

    if (c.nameController.text
        .trim()
        .isEmpty || c.emailController.text
        .trim()
        .isEmpty || c.passwordController.text
        .trim()
        .isEmpty) {
      Get.snackbar("Error", "All fields required.",
        backgroundColor: Colors.red.withOpacity(0.2),);
      return;
    }
    if (c.passwordController.value != c.confirmPasswordController.value) {
      Get.snackbar("Error", "Passwords Mismatch!",
        backgroundColor: Colors.red.withOpacity(0.2),);
      return;
    }
    final name = isValidName();
    final email = isValidEmail();
    final password = isValidPassword();
    if (name == null || email == null || password == null) {
      return;
    }

    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("${dotenv.env['API_URL']!}/user/signup"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 201) {
        c.nameController.clear();
        c.emailController.clear();
        c.passwordController.clear();
        c.confirmPasswordController.clear();
        Get.snackbar("Success", "Registration Successful");
        Get.offAllNamed("/login");
      } else {
        Get.snackbar("Alert", "Registration Failed");
      }
    }finally{
      isLoading.value = false;
    }

    }


    Future<void> login() async {
      if (c.emailController.text.trim().isEmpty || c.passwordController.text.trim().isEmpty) {
        Get.snackbar("Error", "Email and password are required.",
          backgroundColor: Colors.red.withOpacity(0.2),);
        return;
      }
      final email = isValidEmail();
      final password = isValidPassword();
      if (email == null || password == null) {
        return;
      }

      final response = await http.post(
      Uri.parse("${dotenv.env['API_URL']!}/login/"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'password',
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      await secureStorage.write(key: "token", value: token);
      Get.snackbar("Success","Login Successful");
      c.resetState();
      Get.find<HomePageController>().fetchTodos();
      c.emailController.clear();
      c.passwordController.clear();
      Get.offAllNamed("/home");
    } else {
      Get.snackbar("Login Failed", "Invalid email or password");
    }
  }

  Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.deleteAll();        // Clear token
    Get.find<HomePageController>().todoActivities.clear();
    Get.offAll(() => OnboardingScreen());      // Navigate to onboarding or login
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: "token");
  }

}
