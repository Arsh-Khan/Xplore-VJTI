import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xplorevjtiofficialapp/constants/app_constants.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';

class UpdateStudentDetails extends StatefulWidget {
  const UpdateStudentDetails({super.key});

  @override
  State<UpdateStudentDetails> createState() => _UpdateStudentDetailsState();
}

class _UpdateStudentDetailsState extends State<UpdateStudentDetails> {
  late final TextEditingController dateInput;
  late final TextEditingController _email;
  late final TextEditingController _name;
  late final TextEditingController _lname;
  late final TextEditingController _regID;

  @override
  void initState() {
    dateInput = TextEditingController();
    _email = TextEditingController();
    _name = TextEditingController();
    _lname = TextEditingController();
    _regID = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    dateInput.dispose();
    _email.dispose();
    _name.dispose();
    _lname.dispose();
    _regID.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments as dynamic;
    log(data.toString());
    if (data['email'] != "" || data['email'] != null) {
      final space = data['name'].indexOf(" ");
      dateInput.text = data['dob'];
      _name.text = data['name'].substring(0, space - 1);
      _lname.text = data['name'].substring(space + 1);
      _regID.text = data['regId'];
      branchesvalue = data['branch'];
    }
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
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
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Update your Details',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 5, 5),
                )),
            const SizedBox(
              height: 80,
            ),
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
                    labelText: 'Enter First Name',
                    hintText: 'First Name',
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _name,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Enter Last Name',
                    hintText: 'Last Name',
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
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Date Of Birth" //label text of field
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
                          DateFormat('dd - MM - yyyy').format(pickedDate);
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
                      icon: const Icon(Icons.arrow_drop_down_rounded),
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
            Center(
              child: ElevatedButton.icon(
                  onPressed: () async {
                    final updateData = MongoDbUserModel(
                        id: data.id,
                        name: _name.text + " " + _lname.text,
                        email: data.email,
                        regId: _regID.text,
                        branch: branchesvalue,
                        dob: dateInput.text,
                        password: data.password);
                    await MongoDatabase.updateUserData(updateData)
                        .whenComplete(() => Navigator.pop(context));
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update Details')),
            )
          ],
        ),
      )),
    );
  }
}
