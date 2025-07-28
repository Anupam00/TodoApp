import 'package:TodoApp/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/home_page_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController ac = Get.find<AuthController>();
  final HomePageController c = Get.find<HomePageController>();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              "Create Your Account",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30,),
            Icon(Icons.person_add_alt_1,
            size: 100,
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: c.nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
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
                  hintText: "Name",
                  label: Text("Name Field"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  hintText: "Email",
                  label: Text("Email Address"),
                ),
              ),
            ),

            Obx(()=>
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: c.passwordController,
                obscureText: c.isHidden.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    child: c.iconState.value,
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
                  label: Text("Password"),
                ),
              ),
            ),
            ),
            Obx(()=>
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: c.confirmPasswordController,
                    obscureText: c.isHidden.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        child: c.iconState.value,
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
                      hintText: " Confirm Password",
                      label: Text("Confirm Password"),
                    ),
                  ),
                ),
            ),

            Obx(() => ElevatedButton(
              onPressed: ac.isLoading.value
                  ? null
                  : () {
                ac.register();
              },
              child: ac.isLoading.value
                  ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : Text("Register"),
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text('Already have an account? Login '),
                InkWell(
                  child: Text("Here",style: TextStyle(color: Colors.blueAccent),),
                  onTap: (){
                    Get.offNamed('/login');

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
