import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/utilites/check_vjti_email.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class ForgotPasswordVJTIView extends StatefulWidget {
  const ForgotPasswordVJTIView({super.key});

  @override
  State<ForgotPasswordVJTIView> createState() => _ForgotPasswordVJTIViewState();
}

class _ForgotPasswordVJTIViewState extends State<ForgotPasswordVJTIView> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, loginVJTIRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 124, 5, 5),
              size: 30,
            )),
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        title: const Text(
          'VJTI',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 50,
            letterSpacing: 7,
            color: Color.fromARGB(255, 124, 5, 5),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(children: [
            const SizedBox(height: 40),
            TextFormField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                hintText: 'Enter Email',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 145, 38, 22),
                ),
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // TextFormField(
            //   controller: _password,
            //   obscureText: true,
            //   enableSuggestions: false,
            //   autocorrect: false,
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: const InputDecoration(
            //     // border: OutlineInputBorder(),
            //     hintText: 'Enter New Password',
            //     hintStyle: TextStyle(
            //       color: Color.fromARGB(255, 145, 38, 22),
            //     ),
            //     icon: Icon(Icons.lock_outline_rounded),
            //   ),
            // ),
            // const SizedBox(
            //   height: 40,
            // ),
            // TextFormField(
            //   controller: _confirmpassword,
            //   obscureText: true,
            //   enableSuggestions: false,
            //   autocorrect: false,
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: const InputDecoration(
            //     // border: OutlineInputBorder(),
            //     hintText: 'Enter New Confirm Password',
            //     hintStyle: TextStyle(
            //       color: Color.fromARGB(255, 145, 38, 22),
            //     ),
            //     icon: Icon(Icons.lock_outline_rounded),
            //   ),
            // ),

            const Text(
              'Open your mailbox',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 5, 5),
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            FloatingActionButton.extended(
              heroTag: 'fp-1',
              onPressed: () async {
                _showMyDialog();
                // final user = await FirebaseAuth.instance.currentUser;
                // log(user.toString());
                final email = _email.text;
                bool isVJTIEmail = emailCheck(email);
                log(isVJTIEmail.toString());
                if (isVJTIEmail) {
                  final data = await MongoDatabase.getUserQueryData(email);
                  log(data.toString());
                  if (data.isNotEmpty) {
                    await AuthService.firebase()
                        .reAuthenticateEmail(email: email);
                    // final user = AuthService.firebase().currentUser;
                    // if (user!.isEmailVerified) {
                    // } else {
                    //   AuthService.firebase().sendEmailVerification();
                    // }
                  } else {
                    showErrorDiaglog(context, 'User Dosent Exists');
                  }
                } else {
                  showErrorDiaglog(context, 'Not a Valid VJTI Email ID');
                }
              },
              label: const Text('Done?'),
              icon: const Icon(Icons.done),
              backgroundColor: const Color.fromARGB(255, 124, 5, 5),
            ),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              heroTag: 'fp-2',
              onPressed: () async {
                Navigator.pushNamed(context, loginVJTIRoute);
              },
              label: const Text('Return to Login Page'),
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              backgroundColor: const Color.fromARGB(255, 124, 5, 5),
            ),
          ]),
        ),
      ),
    );

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 100,
          backgroundColor: Colors.deepOrange[50],
          title: Text(
            'Password Reset',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color.fromARGB(255, 124, 5, 5),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Please open your Mailbox',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Done?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                print(
                  'Confirmed',
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  loginVJTIRoute,
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: Text(
                'Go Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
