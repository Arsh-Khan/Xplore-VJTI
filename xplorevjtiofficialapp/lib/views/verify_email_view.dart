import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        title: const Text(
          'Verify Email',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 20,
            letterSpacing: 2,
            color: Color.fromARGB(255, 124, 5, 5),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(children: [
        const Text(
            "We've Send you an email verification. Please open it to verify your account."),
        const Text(
            "If you haven't recieved a verification email yet, press the button below"),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send Email Verification')),
        // TextButton(
        //     onPressed: () async {
        //       Navigator.of(context)
        //           .pushNamedAndRemoveUntil(loginVJTIRoute, (route) => false);
        //     },
        //     child: const Text('Login')),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginVJTIRoute, (route) => false);
            },
            child: const Text('Restart')),
      ]),
    );
  }
}
