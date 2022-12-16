import 'package:xplorevjtiofficialapp/services/auth/auth_user.dart';
import 'package:flutter/material.dart';

abstract class AuthProvider {
  /*
    This class provides the function initialization for Firebase Auth Provider
    class where the actual implementaion of the functions is done.

    This class provides the basic framework of functions which will be implemented
    by Firebase Auth class.

    These are own custom functions which will be used in main code instead of
    actual firebase implementation code for abstraction.
  */

  AuthUser? get currentUser;

  Future<void> initalize();

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();

  Future<void> googleSignIn({required BuildContext context});

  Future<void> phoneSignIn(
      {required BuildContext context, required String phoneNumber});
  // Future<void> facebookSignIn({required BuildContext context});

  // Future<void> twofactorauthentication(
  //     {required String email,
  //     required String password,
  //     required String phoneNumber,
  //     required BuildContext context});
}
