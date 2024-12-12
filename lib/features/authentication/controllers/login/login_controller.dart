import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinity_edge_app/data/repositries/authentication/authentication_repository.dart';
import 'package:infinity_edge_app/features/personalization/controllers/user_controller.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/helpers/network_manager.dart';
import 'package:infinity_edge_app/utils/popups/full_screen_loader.dart';
import 'package:infinity_edge_app/utils/popups/loaders.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
          "Logging You In....", KImages.docerAnimation);

      // internet connnectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      KFullScreenLoader.stopLoading();

      // Screen Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Remove loader
      KFullScreenLoader.stopLoading();
      // Show some generic error to user
      KLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // Future<void> googleSignIn() async {
  //   try {
  //     // Start Loading
  //     KFullScreenLoader.openLoadingDialog(
  //         "Logging You In...", KImages.docerAnimation);

  //     // internet connnectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if (!isConnected) {
  //       // Remove loader
  //       KFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     // Google Authentication
  //     final userCredentials =
  //         await AuthenticationRepository.instance.signInWithGoogle();

  //     // Save user record
  //     await userController.saveUserRecord(userCredentials);

  //     // Remove the loader
  //     KFullScreenLoader.stopLoading();

  //     // Redirect
  //     AuthenticationRepository.instance.screenRedirect();
  //   } catch (e) {
  //     KFullScreenLoader.stopLoading();
  //     KLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
  //   }
  // }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
          "Logging You In...", KImages.docerAnimation);

      // Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        KFullScreenLoader.stopLoading();
        KLoaders.errorSnackBar(
            title: "No Internet",
            message: "Please check your internet connection.");
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      if (userCredentials == null) {
        throw Exception("Google Sign-In returned null credentials.");
      }

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove the loader
      KFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      KFullScreenLoader.stopLoading();

      // Print the error to console for debugging
      print("Google Sign-In Error: $e");

      // Show error message
      KLoaders.errorSnackBar(
          title: "Oh Snap!",
          message: "Sign in failed, please try again. Error: $e");
    }
  }
}
