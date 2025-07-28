import 'package:TodoApp/controllers/auth_controller.dart';
import 'package:TodoApp/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController ac = Get.find<AuthController>();
  final HomePageController c = Get.find<HomePageController>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              "Login With Your Account",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40,),
            Icon(Icons.person,
              size: 100,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: c.emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Email Address",
                  label: Text("Email Address"),
                ),
              ),
            ),
            Obx(()=>
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: c.passwordController,
                obscureText: c.isHidden.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    child:c.iconState.value,
                    onTap: (){
                      c.showPassword();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Password",
                  label: Text("Password Field"),
                ),
              ),
            ),
            ),
            ElevatedButton(
              onPressed: () {
                ac.login();
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("Don't have an account? Register "),
                InkWell(
                  child: Text("Here",style: TextStyle(color: Colors.blueAccent),),
                  onTap: (){
                    Get.offNamed('/register');

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
