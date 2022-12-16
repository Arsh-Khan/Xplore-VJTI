import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_provider.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_user.dart';
import 'package:xplorevjtiofficialapp/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  /*
    This class is used to pass the required parameters of the AuthProvider
    class from user to this class which goes to Firebase Auth Provider
  */
  final AuthProvider provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initalize() => provider.initalize();

  // @override
  // Future<void> facebookSignIn({required BuildContext context}) =>
  //     provider.facebookSignIn(context: context);
  @override
  Future<void> googleSignIn({required BuildContext context}) =>
      provider.googleSignIn(context: context);

  @override
  Future<void> phoneSignIn(
          {required BuildContext context, required String phoneNumber}) =>
      provider.phoneSignIn(context: context, phoneNumber: phoneNumber);

  // @override
  // Future<void> twofactorauthentication(
  //         {required String email,
  //         required String password,
  //         required String phoneNumber,
  //         required BuildContext context}) =>
  //     provider.twofactorauthentication(
  //         email: email,
  //         password: password,
  //         phoneNumber: phoneNumber,
  //         context: context);
}
