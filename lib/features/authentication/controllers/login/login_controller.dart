import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinity_edge_app/data/repositries/authentication/authentication_repository.dart';
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

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
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
}
