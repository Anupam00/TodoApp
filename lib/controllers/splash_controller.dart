import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _handleStartup();
  }

  void _handleStartup() async {
    try {
      await http.get(Uri.parse("${dotenv.env['API_URL']!}/status"));

      final isFirstTime = box.read("first_time") ?? true;
      final token = await secureStorage.read(key: "token");

      if (isFirstTime) {
        box.write("first_time", false);
        Get.offAllNamed("/onboarding");
      } else if (token != null) {
        final res = await http.get(
          Uri.parse("${dotenv.env['API_URL']!}/user/me"),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (res.statusCode == 200) {
          Get.offAllNamed("/home");
        } else {
          Get.offAllNamed("/login");
        }
      } else {
        Get.offAllNamed("/login");
      }
    } catch (e) {
      print("Splash error: $e");
      Get.offAllNamed("/login");
    }
  }
}
