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
  ScrollController _scrollController = new ScrollController();

  late final TextEditingController messageController;
  ScrollController controller = ScrollController();
  scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 500));
    final position = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }


  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      )
          .then((value) async {
        await Future.delayed(Duration(seconds: 2));
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      });
    });
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 124, 5, 5),
        onPressed: () {
          if (_scrollController.hasClients) {
            final position = _scrollController.position.maxScrollExtent;
            _scrollController.animateTo(
              position,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          }
        },
        isExtended: true,
        tooltip: "Scroll to Bottom",
        child: Icon(Icons.arrow_downward),
      ),
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        // actions: <Widget>[
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, dashBoardRoute);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color.fromARGB(255, 124, 5, 5),
                size: 30,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 5, 20, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      //pushnamed to header view
                      final userdetails = data;
                      Navigator.of(context).pushNamed(
                          participantSeniorAdviceRoute,
                          arguments: userdetails);
                    },
                    tooltip: 'Participants',
                    icon: const Icon(
                      Icons.people_alt_outlined,
                      color: Color.fromARGB(255, 124, 5, 5),
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        scrollToBottom();
                      });
                      scrollToBottom();
                    },
                    tooltip: 'Refresh Page',
                    icon: Icon(
                      Icons.refresh,
                      size: 30,
                      color: Color.fromARGB(255, 124, 5, 5),
                    )),
              ],
            ),
          ),
        ],
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
        controller: _scrollController,
        scrollDirection: Axis.vertical,
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
                      child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 124, 5, 5)),
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
                                  // controller: _scrollController,
                                  physics: NeverScrollableScrollPhysics(),
                                  // reverse: true,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return displayCard(
                                        MongoDbSeniorAdviceModel.fromJson(
                                            snapshot.data![index]),data);
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: messageController,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 124, 5, 5),
                hoverColor: Color.fromARGB(255, 124, 5, 5),
                iconColor: Color.fromARGB(255, 124, 5, 5),
                focusColor: Color.fromARGB(255, 124, 5, 5),
                hintText: 'Message',
                suffixIcon: IconButton(
                    onPressed: () async {
                      int a = 0;
                      // scrollToBottom();
                      final result =
                          await insertMessage(data, messageController.text);
                      if (result == 'Success') {
                        messageController.text = "";
                        // setState(() {
                        //   scrollToBottom();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_scrollController.hasClients){

                            _scrollController.jumpTo(_scrollController.position.maxScrollExtent+500);
                          }
                          else {
                            setState(() {
                              return null;
                            });
                          }
                        // });
                        });
                        // scrollToBottom();
                      } else if (result == 'Empty Field') {
                      } else {
                        showErrorDiaglog(context, result);
                      }
                      // final position =
                      //     _scrollController.position.maxScrollExtent;
                      // await _scrollController.animateTo(
                      //   position,
                      //   duration: Duration(seconds: 1),
                      //   curve: Curves.fastOutSlowIn,
                      // );
                    },
                    icon: Icon(Icons.send,
                        color: Color.fromARGB(255, 124, 5, 5))),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget displayCard(MongoDbSeniorAdviceModel data,dynamic userdetails) {
    var color = Colors.white;
    if (data.status == 'ADMIN') {
      color = Color.fromRGBO(247, 233, 202, 1);
    }else if(data.email == userdetails['email']){
      color = Color.fromARGB(255, 241, 239, 119);
    }
     else {
      color = Colors.white;
    }
    var userStatus = '';
    if (data.status == 'ADMIN') {
      userStatus = '~(Admin)';
    } else {
      userStatus = '';
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Volkorn',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 124, 5, 5),
                      letterSpacing: 0,
                    ),
                    children: [
                      TextSpan(
                        text: "${data.name}    (${data.year})",
                        style: TextStyle(letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
                Text(
                  ' $userStatus',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: 'Volkorn',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 124, 5, 5),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${data.message}',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            Text('${data.time}',
                textAlign: TextAlign.right,
                style: TextStyle(
                    letterSpacing: 1, color: Colors.deepOrangeAccent[700])),
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
  if (
    (userdata['email'] == 'rsrao_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'afkhan_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'rvjani_b21@et.vjti.ac.in') ||
      (userdata['email'] == 'afkhan_b21@el.vjti.ac.in') ||
      (userdata['email'] == 'askarawale_b21@et.vjti.ac.in')
      ) {
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
