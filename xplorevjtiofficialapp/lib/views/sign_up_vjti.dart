import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:intl/intl.dart';
import 'package:xplorevjtiofficialapp/constants/app_constants.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_exceptions.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';
import 'package:xplorevjtiofficialapp/utilites/check_vjti_email.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class SignUpVJTI extends StatefulWidget {
  const SignUpVJTI({super.key});

  @override
  State<SignUpVJTI> createState() => _SignUpVJTIState();
}

class _SignUpVJTIState extends State<SignUpVJTI> {
  late final TextEditingController dateInput;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpassword;
  late final TextEditingController _name;
  late final TextEditingController _regID;

  @override
  void initState() {
    dateInput = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
    _name = TextEditingController();
    _regID = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    dateInput.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _name.dispose();
    _regID.dispose();
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
                      boxShadow: const [
                        BoxShadow(
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
                const SizedBox(height: 30),
                FloatingActionButton.extended(
                  heroTag: 'btn-1',
                  backgroundColor: const Color.fromARGB(85, 219, 112, 112),
                  elevation: 0,
                  label: const Text('Not yet VJTIian?',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      )),
                  onPressed: () {
                    Navigator.of(context).pushNamed(signUpNonVJTIRoute);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('VJTI Students',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: const Color.fromARGB(103, 236, 183, 183),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                loginVJTIRoute, (route) => false);
                          },
                          child: const Text(
                            'Already have an account? Login instead!',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Sign Up',
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
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _name,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.person),
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
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: TextField(
                              controller: dateInput,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText:
                                      "Date Of Birth" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    // DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('dd - MM - yyyy')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ))),

                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'VJTI mail id',
                                hintText: 'Enter your VJTI email id',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.mail_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Registration Number
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _regID,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Reg. Number',
                                hintText: 'Enter your Registration Number',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.numbers_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Branch
                        const Text(
                          'Select Branch',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color.fromARGB(255, 145, 38, 22),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                DropdownButton(
                                  value: branchesvalue,
                                  icon:
                                      const Icon(Icons.arrow_drop_down_rounded),
                                  items: branches.map((String branches) {
                                    return DropdownMenuItem(
                                      value: branches,
                                      child: Text(
                                        branches,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newval) {
                                    setState(() {
                                      branchesvalue = newval!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Create Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color.fromARGB(255, 145, 38, 22),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // CREATE PASSWORD
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
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Create Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // CONFIRM PASSWORD

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _confirmpassword,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const SizedBox(height: 10),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 124, 5, 5),
                          child: InkWell(
                            onTap: () async {
                              final email = _email.text;
                              final password = _password.text;
                              final confirmPassword = _confirmpassword.text;
                              final name = _name.text;
                              try {
                                final isVJTIEmailID = emailCheck(email);
                                final isPasswordSame =
                                    (password == confirmPassword)
                                        ? true
                                        : false;
                                devtools.log(isPasswordSame.toString());
                                devtools.log(isVJTIEmailID.toString());
                                devtools.log('$email + $password');
                                if (isVJTIEmailID && isPasswordSame) {
                                  await AuthService.firebase().createUser(
                                      email: email, password: password);
                                  final user =
                                      AuthService.firebase().currentUser;

                                  if (user?.isEmailVerified ?? false) {
                                    // devtools.log(userCredential.toString());
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            dashBoardRoute, (route) => false);
                                  } else {
                                    await AuthService.firebase()
                                        .sendEmailVerification();
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            verifyEmailRoute, (route) => false);
                                  }
                                } else {
                                  showErrorDiaglog(
                                      context, 'Enter a Valid VJTI ID');
                                }
                              } on WeakPasswordAuthException {
                                await showErrorDiaglog(
                                    context, 'Weak Password');
                              } on EmailAlreadyInUseAuthException {
                                await showErrorDiaglog(
                                    context, 'Email is already in use');
                              } on InvalidEmailAuthException {
                                await showErrorDiaglog(context,
                                    'This is an invalid email address');
                              } on GenericAuthExceptions {
                                await showErrorDiaglog(
                                    context, 'Failed to register');
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
