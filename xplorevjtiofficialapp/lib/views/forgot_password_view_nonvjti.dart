import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/auth_service.dart';

class ForgotPasswordNonVJTIView extends StatefulWidget {
  const ForgotPasswordNonVJTIView({super.key});

  @override
  State<ForgotPasswordNonVJTIView> createState() =>
      _ForgotPasswordNonVJTIViewState();
}

class _ForgotPasswordNonVJTIViewState extends State<ForgotPasswordNonVJTIView> {
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
              Navigator.pushNamed(context, loginNonVJTIRoute);
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
              heroTag: 'fpnv-1',
              onPressed: () async {
                // final user = await FirebaseAuth.instance.currentUser;
                // log(user.toString());
                final email = _email.text;
                await AuthService.firebase().reAuthenticateEmail(email: email);
              },
              label: const Text('Done?'),
              icon: const Icon(Icons.done),
              backgroundColor: const Color.fromARGB(255, 124, 5, 5),
            ),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              heroTag: 'fpnv-2',
              onPressed: () async {
                Navigator.pushNamed(context, loginNonVJTIRoute);
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
