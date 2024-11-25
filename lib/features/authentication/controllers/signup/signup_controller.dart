import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/data/repositries/authentication/authentication_repository.dart';
import 'package:infinity_edge_app/data/repositries/user/user_repository.dart';
import 'package:infinity_edge_app/features/authentication/models/user_model.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/verify_email.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/helpers/network_manager.dart';
import 'package:infinity_edge_app/utils/popups/full_screen_loader.dart';
import 'package:infinity_edge_app/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding and showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// SignUp
  void signUp() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
          "We are processing your information....", KImages.docerAnimation);

      // internet connnectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        KLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must read and accept the Privacy Policy and Terms of Use",
        );
        return;
      }

      // Register user in the firebase authentication & Save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
        KFullScreenLoader.stopLoading();

      // Show success message
      KLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created!, Verify email to continue");

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      //Remove loader
      KFullScreenLoader.stopLoading();
      // Show some generic error to user
      KLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
