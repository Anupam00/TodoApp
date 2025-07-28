import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/images/icontodo.png", width: 200),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            const Text("Getting Started. Please Wait...", style: TextStyle(fontSize: 16)),

          ],
        ),
      ),
    );
  }
}
