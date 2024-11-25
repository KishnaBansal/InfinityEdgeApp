import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/features/authentication/models/user_model.dart';
import 'package:infinity_edge_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/firebase_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/format_exceptions.dart';
import 'package:infinity_edge_app/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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
