import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';

class DeleteSeniorsMessages extends StatefulWidget {
  const DeleteSeniorsMessages({super.key});

  @override
  State<DeleteSeniorsMessages> createState() => _DeleteSeniorsMessagesState();
}

class _DeleteSeniorsMessagesState extends State<DeleteSeniorsMessages> {
  ScrollController _scrollController = ScrollController();
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
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 124, 5, 5),
        onPressed: () {
          if (_scrollController.hasClients) {
            final position = _scrollController.position.maxScrollExtent;
            _scrollController.animateTo(
              position,
              duration: Duration(milliseconds: 500),
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
        leading: IconButton(
            onPressed: () async {
              setState(() async {
                final userdetails = await userDetails();
                Navigator.pushNamed(context, seniorAdviceRoute,
                    arguments: userdetails);
              });
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
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Delete Messages',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 5, 5),
                )),
            const SizedBox(height: 20),
            SafeArea(
                child: FutureBuilder(
              future: MongoSeniorAdviceDatabase.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 124, 5, 5),
                    ),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: const Color.fromARGB(103, 236, 183, 183),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return displayCard(
                                MongoDbSeniorAdviceModel.fromJson(
                                    snapshot.data![index]));
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: const Text('Khufiya Jaga hai yeh'),
                    );
                  }
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget displayCard(MongoDbSeniorAdviceModel data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Card(
        color: Colors.white,
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
                IconButton(
                    onPressed: () async {
                      await MongoSeniorAdviceDatabase.deleteMessage(data);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete_outline_rounded))
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
        //  IconButton(
        //         onPressed: () async {
        //           await MongoSeniorAdviceDatabase.deleteMessage(data);
        //           setState(() { });
        //         },
        //         icon: Icon(Icons.delete_outline_rounded))
      ),
    );
  }
}
