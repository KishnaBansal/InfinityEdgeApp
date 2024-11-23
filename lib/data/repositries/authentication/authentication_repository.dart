import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinity_edge_app/features/authentication/screens/login/login.dart';
import 'package:infinity_edge_app/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relelvant screen
  screenRedirect() async {
    if (kDebugMode) {
      print("====================Get Storage==================");
      print(deviceStorage.read("isFirstTime"));
    }
    // Local Storage
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
  }
}
