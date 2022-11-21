import 'package:flutter/material.dart';
import 'package:xplorevjti/constants/routes.dart';
import 'package:xplorevjti/services/auth/auth_service.dart';
import 'package:xplorevjti/views/login_view.dart';
import 'package:xplorevjti/views/notes_view.dart';
import 'package:xplorevjti/views/register_view.dart';
import 'package:xplorevjti/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initalize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  devtools.log('User is Verified');
                  return const NotesView();
                } else {
                  // Anonymous Route
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const VerifyEmailView(),
                  // ));
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
