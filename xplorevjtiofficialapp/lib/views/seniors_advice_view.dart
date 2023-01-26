import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/utilites/reg_no_tod_diya_jaye.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';
import 'package:xplorevjtiofficialapp/utilites/time_decode.dart';

class SeniorAdviceView extends StatefulWidget {
  const SeniorAdviceView({super.key});

  @override
  State<SeniorAdviceView> createState() => _SeniorAdviceViewState();
}

class _SeniorAdviceViewState extends State<SeniorAdviceView> {
  late final TextEditingController messageController;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;

    log(data.toString() + "hello");

    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        //actions: <Widget>[
        leading: IconButton(
            onPressed: () async {
              //pushnamed to header view
              final userdetails = data;
              Navigator.of(context).pushNamed(participantSeniorAdviceRoute,
                  arguments: userdetails);
            },
            tooltip: 'header',
            icon: const Icon(
              Icons.menu_sharp,
              color: Colors.black,
            )),
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              color: Color.fromARGB(128, 0, 0, 0),
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Seniors Advice',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 5, 5),
                )),
            const SizedBox(height: 0),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: FutureBuilder(
                future: MongoSeniorAdviceDatabase.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData =
                          snapshot.data!.length; //getting total length of data

                      print('Total Data' + totalData.toString());

                      // return Text('Data Found');
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(85, 219, 112, 112),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: ListView.builder(
                                  controller: controller,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return displayCard(
                                        MongoDbSeniorAdviceModel.fromJson(
                                            snapshot.data![index]));
                                  }),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("No data Available"),
                      );
                    }
                  }
                },
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: MediaQuery.of(context).viewInsets,
        child: TextField(
          controller: messageController,
          enableSuggestions: true,
          autocorrect: false,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Message',
            suffixIcon: IconButton(
                onPressed: () async {
                  final result =
                      await insertMessage(data, messageController.text);
                  if (result == 'Success') {
                    messageController.text = "";
                    setState(() {
                      // Navigator.of(context).pushNamed(seniorAdviceRoute);
                    });
                  } else if (result == 'Empty Field') {
                  } else {
                    showErrorDiaglog(context, result);
                  }
                },
                icon: Icon(Icons.send)),
          ),
        ),
      ),
    );
  }

  Widget displayCard(MongoDbSeniorAdviceModel data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Card(
        color: Color.fromARGB(222, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                    children: [
                      TextSpan(
                        text: "${data.name}",
                        style: TextStyle(letterSpacing: 1),
                      ),
                      TextSpan(
                        text: "${data.year}",
                        style: TextStyle(letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        letterSpacing: 2),
                    children: [
                  TextSpan(
                    text: "${data.message}",
                    style: TextStyle(letterSpacing: 1),
                  )
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            letterSpacing: 2),
                        children: [
                      TextSpan(
                        text: '${data.time}',
                        style: TextStyle(letterSpacing: 1),
                      )
                    ])),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

Future<String> insertMessage(dynamic userdata, String message) async {
  String time = DateTime.now().toString();
  final timeDetails = timeDecode(time);

  String status = "";
  if ((userdata['email'] == 'rsrao_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'afkhan_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'rvjani_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'askarawale_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'afkhan_b21@el.vjti.ac.in')) {
    status = "ADMIN";
  } else {
    status = "PARTICIPANT";
  }

  var id = M.ObjectId();
  final detailsfromregId = detailsFromRegID(userdata['regId']);

  if (message != "") {
    final data = MongoDbSeniorAdviceModel(
        id: id,
        name: userdata['name'],
        email: userdata['email'],
        year: detailsfromregId[0] + " " + detailsfromregId[1],
        time:
            "${timeDetails['date']} ${timeDetails['month']}${timeDetails['year']} ${timeDetails['hour']}:${timeDetails['min']}",
        status: status,
        message: message);

    var result = await MongoSeniorAdviceDatabase.insert(data);
    if (result == 'Something went wrong while inserting data') {
      return 'Something went wrong. Try again';
    } else {
      return 'Success';
    }
  } else {
    return "Empty Field";
  }
}
