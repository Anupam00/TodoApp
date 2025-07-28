import 'package:TodoApp/controllers/auth_controller.dart';
import 'package:TodoApp/services/api_service.dart';
import 'package:TodoApp/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/storagekey.dart';
import '../views/home.dart';
import '../views/settings.dart';
import '../views/todos.dart';

class HomePageController extends GetxController {
  AuthController get ac => Get.find<AuthController>();

  TextEditingController tc = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RxList pages = [
    { "icons" : Icon(Icons.home), "label" : "Home"},
    { "icons" : Icon(Icons.book), "label" : "Todos"},
    { "icons" : Icon(Icons.settings), "label" : "Settings"},
  ].obs;

  RxInt currentIndex = 0.obs;


   changeIndex(int index){
    currentIndex.value = index;
  }

 changeNavigation(){
    if (currentIndex.value == 0){
      return Home(c: this);
    }
    if (currentIndex.value == 1){
      return Todos(c: this);
    }
    if (currentIndex.value == 2){
      return Settings(c: this,ac:ac);
    }

 }

  final storage = FlutterSecureStorage();

 RxList todoActivities = [].obs;
   int? edit_index;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void>fetchTodos()async{
    final data = await TodoService.getTodos();
    data.sort((a,b)=>a['id'].compareTo(b['id']));
    todoActivities.assignAll(data);
  }
 saveOrUpdateTodo() async{
   final item = tc.text.trim();
   final isNumeric = double.tryParse(tc.text) != null;
   if (edit_index == null) {
     if (tc.text.trim().isEmpty) {
       Get.snackbar(
           "Alert", "TextField cannot be left empty.Please input the value",
       backgroundColor: Colors.red.withOpacity(0.2));
       return;
     } else if (isNumeric) {
       Get.snackbar("Alert", "Input should be a string, not a number",
       backgroundColor: Colors.red.withOpacity(0.2));
       return;
     } else {
       final successCall = await TodoService.createTodo(tc.text);
       if (successCall) {
         Get.snackbar("Message", "Save Successful",
             backgroundColor: Colors.green.withOpacity(0.2));
       }else{
         Get.snackbar("Error", "Failed to delete todo");
       }
       tc.clear();
       edit_index = null;
       await fetchTodos();
       changeIndex(1);
     }
   }else{
     final todo = todoActivities[edit_index!];
    await TodoService.updateTodo(todo['id'], item);

   }
   await fetchTodos();
   tc.clear();
   edit_index = null;
   Get.back();
 }


 void prepareUpdate(int index){
   edit_index = index;
   tc.text = todoActivities[index]['body'];
 }

    void deleteTodo(int index) async {
    final todo = todoActivities[index];
    final successCall = await TodoService.removeTodo(todo['id']);
    if (successCall) {
      Get.snackbar("Message", "Todo Deleted",
          backgroundColor: Colors.amber.withOpacity(0.2));
    }else{
      Get.snackbar("Error", "Failed to delete todo");
    }
    await fetchTodos();
  }

  void resetState() {
    currentIndex.value = 0;
    edit_index = null;
    tc.clear();
  }


  RxBool isHidden = true.obs;
  Rx <Icon> iconState = Icon(Icons.visibility_off).obs;

  showPassword(){
    isHidden.value = !isHidden.value;
    if (isHidden.value){
      iconState.value = Icon(Icons.visibility_off);
    }else{
      iconState.value = Icon(Icons.visibility);
    }
  }



}
