import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/update.dart';
import 'package:xplorevjtiofficialapp/utilites/check_vjti_email.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class ForgotPasswordVJTIView extends StatefulWidget {
  const ForgotPasswordVJTIView({super.key});

  @override
  State<ForgotPasswordVJTIView> createState() => _ForgotPasswordVJTIViewState();
}

class _ForgotPasswordVJTIViewState extends State<ForgotPasswordVJTIView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
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
              heroTag: 'btn-1',
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                final confirmpassword = _confirmpassword.text;
                bool isVJTIEmail = emailCheck(email);
                if (isVJTIEmail) {
                  if (password == confirmpassword) {
                    final result = await updateUserPassword(email, password);
                    await AuthService.firebase()
                        .reAuthenticateEmail(email: email, password: password);
                    final user = AuthService.firebase().currentUser;
                    if (result != "" && user!.isEmailVerified) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Something went Wrong')));
                    }
                  } else {
                    showErrorDiaglog(context,
                        'New password and confirm password dosent matches');
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
              heroTag: 'btn-1',
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
}
