import 'package:TodoApp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:TodoApp/controllers/home_page_controller.dart';

class Settings extends StatelessWidget {
   Settings({super.key ,
    required this.c,
     required this.ac,});

  final HomePageController c;
  final AuthController ac;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30,),
        Center(
          child: Container(
            height: 40,
            width: 120,
            child: ElevatedButton(onPressed: ac.logout, child: Center(
              child:Text("Logout"),
            ),),
          ),
        )
      ],
    );
  }
}
