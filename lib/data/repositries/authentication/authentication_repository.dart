import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infinity_edge_app/features/authentication/screens/login/login.dart';
import 'package:infinity_edge_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:infinity_edge_app/features/authentication/screens/signup/verify_email.dart';
import 'package:infinity_edge_app/navigation_menu.dart';
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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
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

  // Email - Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
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

  // Login - Email and Password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  // // Google Authentication
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await userAccount?.authentication;

  //     // Create new credential
  //     final credentials = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  //     // Once signed in return the userCredentials
  //     return await _auth.signInWithCredential(credentials);
  //   } on FirebaseAuthException catch (e) {
  //     throw KFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw KFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw KFormatException();
  //   } on PlatformException catch (e) {
  //     throw KPlatformException(e.code).message;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Something went wrong: $e");
  //       return null;
  //     }
  //   }
  // }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      if (userAccount == null) {
        // The user canceled the sign-in
        throw Exception("Google Sign-In was canceled by the user.");
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount.authentication;
      if (googleAuth == null) {
        throw Exception(
            "Google authentication failed to retrieve auth details.");
      }

      // Create new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in return the userCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.message}");
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      print("FormatException: ${e.toString()}");
      throw KFormatException();
    } on PlatformException catch (e) {
      print("PlatformException: ${e.message}");
      throw KPlatformException(e.code).message;
    } catch (e) {
      print("General Exception: $e");
      throw Exception("Something went wrong: $e");
    }
  }

  // Logout - Valid for any Authentication
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
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
