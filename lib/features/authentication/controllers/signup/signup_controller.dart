import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs, // Observable for hiding/showing password
      privacyPolicy = true.obs,
      email = TextEditingController(),
      lastName = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController(),
      firstName = TextEditingController(),
      phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  void signup() async {
    /// Register user in the Firebase Authentication & Save user data in the Firebase
    final dynamic userCredential = await AuthenticationRepository.instance
        .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    print(
        'User Credential: ${userCredential.user}\n\nuserCredentialType:${userCredential.runtimeType}');

    /// Save Authenticated user data in the Firebase firestore
    final dynamic newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '');

    // final userRepository = Get.put(UserRepository());

    // await userRepository.saveUserRecord(newUser);
    print('New User: ${newUser.toString()}');
    return;

    // ignore: dead_code
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing  your information', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        /// Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        /// Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();

        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create accoutn, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in the Firebase
      final dynamic userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      print('User Credential: ${userCredential.user}');

      /// Save Authenticated user data in the Firebase firestore
      final dynamic newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      // final userRepository = Get.put(UserRepository());

      // await userRepository.saveUserRecord(newUser);
      print('New User: ${newUser.toString()}');

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      /// Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      /// Remove Loader
      TFullScreenLoader.stopLoading();
      print('Oh Snap!\n${e.toString()}');

      /// Show some Generic Error to the user
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: e.toString(), duration: 5);
    }
  }
}
