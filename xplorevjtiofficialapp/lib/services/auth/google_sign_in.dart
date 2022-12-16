import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_exceptions.dart';

// My take is integrate in firebase auth provider

Future<void> googleSignIn(BuildContext context) async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print(userCredential); //

      if (userCredential.user != null) {
        // if (userCredential.additionalUserInfo!.isNewUser) {
        //   // Basically a currently created new user}
        Navigator.of(context)
            .pushNamedAndRemoveUntil(dashBoardRoute, (route) => false);
      }
    }
  } catch (e) {
    throw GenericAuthExceptions();
  }
}
