import 'package:TodoApp/views/login_page.dart';
import 'package:TodoApp/views/onboarding_page.dart';
import 'package:TodoApp/views/register_page.dart';
import 'package:TodoApp/views/spash_page.dart';
import 'package:flutter/material.dart';
import 'package:TodoApp/views/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'controllers/auth_controller.dart';
import 'controllers/home_page_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await GetStorage.init();
  Get.put(HomePageController());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}

