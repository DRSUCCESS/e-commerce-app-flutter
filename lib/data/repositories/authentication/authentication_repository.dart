import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exception.dart';
import 'package:t_store/utils/exceptions/firebase_exception.dart';
import 'package:t_store/utils/exceptions/format_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage(), _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() {
    /// Local Storage
    /* if (kDebugMode) {
      print('========== GET STORAGE (auth) ========');
      print(deviceStorage.read('IsFirstTime'));
    } */
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* -------------- Email & Password sign-in --------------  */
  /// [EmailAuthentication] - Signin

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(
          'authResult:$result \nresultCredential:${result.credential} \nresultAddInfo:${result.additionalUserInfo} \nresultUser:${result.user}');
      return result;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again... \n\nerrorRuntimeType:${e.runtimeType} \nerrorMsg:${e.toString()}';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - MAIL VERIFICATION

  /// [EmailAuthentication] - FORGET PASSWORD

  /* -------------- Federated identity & social sign-in --------------  */
  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

  /* -------------- Federated identity & social sign-in --------------  */
  /// [LogoutUser] - Valid fo rany authetication

  /// DELETE USER - Remove user a=Auth and Firestore Account
}
