import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_exceptions.dart';
import 'package:xplorevjtiofficialapp/utilites/show_otp_dialog.dart';
import 'dart:developer' show log;

Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
  try {
    TextEditingController codeController = TextEditingController();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Works on Android
        await FirebaseAuth.instance.signInWithCredential(credential);

        Navigator.of(context)
            .pushNamedAndRemoveUntil(dashBoardRoute, (route) => false);
      },
      verificationFailed: (error) {
        // !Error
        log(error.toString());
      },
      codeSent: ((String verificationId, int? resendToken) async {
        await showOTPDialog(
          context: context,
          codeController: codeController,
          onPressedCommand: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: codeController.text.trim(),
            );
            print(credential);
            await FirebaseAuth.instance.signInWithCredential(credential);
            print(FirebaseAuth.instance.currentUser);
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(dashBoardRoute, (route) => false);
          },
        );
      }),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto Resolution Timeout ...
      },
    );
  } catch (e) {
    throw GenericAuthExceptions();
  }
}

// Future<void>signOutPhone(){};s