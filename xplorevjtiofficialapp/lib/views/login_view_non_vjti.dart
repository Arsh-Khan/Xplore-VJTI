import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_exceptions.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class LoginViewNonVJTI extends StatefulWidget {
  const LoginViewNonVJTI({super.key});

  @override
  State<LoginViewNonVJTI> createState() => _LoginViewNonVJTIState();
}

class _LoginViewNonVJTIState extends State<LoginViewNonVJTI> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        title: const Text(
          'VJTI',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 50,
            letterSpacing: 7,
            color: Color.fromARGB(255, 124, 5, 5),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange[50],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 120,
                  width: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 7),
                        )
                      ]),
                  child: ClipRect(
                    child: Image.asset(
                      'assets/Logo_Black.png',
                      height: 100,
                      width: 180,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text('-- non VJTI --',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color.fromARGB(103, 236, 183, 183),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Enter your mail id',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.mail_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _password,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Password bhul gaye kya?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FloatingActionButton.extended(
                          heroTag: 'btn-1',
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;

                            try {
                              await AuthService.firebase()
                                  .logIn(email: email, password: password);
                              final user = AuthService.firebase().currentUser;

                              if (user?.isEmailVerified ?? false) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    dashBoardRoute, (route) => false);
                              } else {
                                await AuthService.firebase()
                                    .sendEmailVerification();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    verifyEmailRoute, (route) => false);
                              }
                            } on UserNotFoundAuthException {
                              await showErrorDiaglog(
                                context,
                                'User not Found',
                              );
                            } on WrongPasswordAuthException {
                              await showErrorDiaglog(
                                context,
                                'Wrong Credentials',
                              );
                            } on GenericAuthExceptions {
                              await showErrorDiaglog(
                                context,
                                'Authentication Error',
                              );
                            }
                          },
                          label: const Text('Login'),
                          icon: const Icon(Icons.laptop_mac_rounded),
                          backgroundColor: const Color.fromARGB(255, 124, 5, 5),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'or',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 10),
                        FloatingActionButton.extended(
                          heroTag: "btn-2",
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                signUpVJTIRoute, (route) => false);
                          },
                          backgroundColor: const Color.fromARGB(255, 124, 5, 5),
                          icon: const Icon(Icons.account_circle_sharp),
                          label: const Text('Sign Up'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
