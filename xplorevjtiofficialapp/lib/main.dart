import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/userDatabase/dbhelper/mongodb.dart';
import 'package:xplorevjtiofficialapp/views/about_vjti_view.dart';
import 'package:xplorevjtiofficialapp/views/dashboard_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/dashboard_view.dart';
import 'package:xplorevjtiofficialapp/views/forgot_password_view_vjti.dart';
import 'package:xplorevjtiofficialapp/views/how_to_get_vjti.dart';
import 'package:xplorevjtiofficialapp/views/login_view_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/login_view_vjti.dart';
import 'package:xplorevjtiofficialapp/views/seniors_advice.dart';
import 'package:xplorevjtiofficialapp/views/sign_up_non_vjti.dart';
import 'package:xplorevjtiofficialapp/views/sign_up_vjti.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/views/splash_screen.dart';
import 'package:xplorevjtiofficialapp/views/student_account.dart';
import 'dart:developer' as devtools show log;
import 'package:xplorevjtiofficialapp/views/verify_email_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: {
      loginVJTIRoute: (context) => const LoginViewVJTI(),
      signUpVJTIRoute: (context) => const SignUpVJTI(),
      loginNonVJTIRoute: (context) => const LoginViewNonVJTI(),
      dashBoardRoute: (context) => const DashBoardView(),
      dashboardViewnonVJTIRoute: (context) => const DashboardView_nonVJTI(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      signUpNonVJTIRoute: (context) => const SignUpNonVJTI(),
      aboutVJTIRoute: (context) => const AboutVJTIView(),
      studentAccountRoute: (context) => const StudentVJTI(),
      howToGetVJTIRoute: (context) => const HowToGetVJTI(),
      forgotPasswordRoute: (context) => const ForgotPasswordVJTIView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      FutureBuilder Widget is used to create widgets based on the latest snapshot of interaction with a Future
      It also helps us  to execute some Asynchronous code and based upon that UI will update.
      It has four states.
    */
    return FutureBuilder(
        future: AuthService.firebase().initalize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              AuthService.firebase().logOut();
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  devtools.log('User is Verified');
                  return const DashBoardView();
                } else {
                  AuthService.firebase().sendEmailVerification();
                  return const VerifyEmailView();
                }
              } else {
                return const LoginViewVJTI();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
