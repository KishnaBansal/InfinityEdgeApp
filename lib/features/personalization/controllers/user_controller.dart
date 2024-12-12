import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/data/repositries/user/user_repository.dart';
import 'package:infinity_edge_app/features/authentication/models/user_model.dart';
import 'package:infinity_edge_app/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          username: username,
          email: userCredentials.user!.email ?? ' ',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      KLoaders.warningSnackBar(
        title: "Data Not Saved",
        message:
            "Something went wrong while saving your information . You can resave your data in your profile",
      );
    }
  }
}
