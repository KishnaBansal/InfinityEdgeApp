import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinity_edge_app/features/authentication/screens/login/login.dart';
import 'package:infinity_edge_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:infinity_edge_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/firebase_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/format_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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

  // Email - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again!";
    }
  }
}
