import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NotesAndPyqView extends StatefulWidget {
  const NotesAndPyqView({super.key});

  @override
  State<NotesAndPyqView> createState() => _NotesAndPyqViewState();
}

class _NotesAndPyqViewState extends State<NotesAndPyqView> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          elevation: 0,
          //actions: <Widget>[
          leading: IconButton(
              onPressed: () {},
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
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Notes & PYQs',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 124, 5, 5),
              )
            ),
            const SizedBox(height: 0),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: FutureBuilder(
                future: MongoNotesAndPyqDatabase.getData(),
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
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(85, 219, 112, 112),
                                borderRadius: BorderRadius.circular(30), 
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return displayCard(MongoDbNotesAndPyqModel.fromJson(
                                        snapshot.data![index]));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 227, 179, 179),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 20),
              child: IconButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, insertNotesAndPyqRoute,
                        arguments: MongoDbNotesAndPyqModel(
                            id: M.ObjectId(),
                            email: 'null',
                            name: 'null',
                            notesANDpyqs: 'null',
                            year: 'null',
                            subject: 'null',
                            topic: 'null',
                            description: 'null',
                            timeofsubmission: 'null',
                            link: 'null'));
                  },
                  icon: Icon(Icons.add_box_outlined, size: 40),
                  tooltip: 'Insert Notes or PYQ'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 20),
              child: IconButton(
                  onPressed: () async {
                    final userdata = await userDetails();
                    Navigator.pushNamed(context, updateNotesAndPyqRoute,
                        arguments: userdata['email'].toString());
                  },
                  tooltip: 'Update Notes or PYQ',
                  icon: Icon(Icons.update, size: 40)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 20),
              child: IconButton(
                  onPressed: () async {
                    final userdata = await userDetails();
                    Navigator.of(context).pushNamed(deleteNotesAndPyqRoute,
                        arguments: userdata['email'].toString());
                  },
                  tooltip: 'Delete Notes',
                  icon: Icon(Icons.delete, size: 40)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 20),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamedAndRemoveUntil(
                          context, notesAndPyqRoute, (route) => false);
                    });
                  },
                  tooltip: 'Refresh Page',
                  icon: Icon(Icons.refresh, size: 40)),
            ),
          ],
        )
      ),
    );
  }

  Widget displayCard(MongoDbNotesAndPyqModel data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Card(
        color: Color.fromARGB(222, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
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
                    text: 'Published On : ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: '${data.timeofsubmission}',
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: '\nName: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: "${data.name}",
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: "\nEmail: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: "${data.email}",
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: "\nType: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: "${data.notesANDpyqs}",
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: "\nYear: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: "${data.year}",
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: '\nSubject: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: '${data.subject}',
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: '\nTopic: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: '${data.topic}',
                    style: TextStyle(letterSpacing: 1)
                  ),
                  TextSpan(
                    text: '\nDescription: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,
                    color: Color.fromARGB(255, 177, 8, 8),)
                  ),
                  TextSpan(
                    text: '${data.description}',
                    style: TextStyle(letterSpacing: 1)
                  ),


                ]
              )
            ),
            // Text('Published On : ${data.timeofsubmission}',
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text("Name: ${data.name}",
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text("Email: ${data.email}",
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text("Type: ${data.notesANDpyqs}",
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text("Year: ${data.year}",
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text('Subject: ${data.subject}',
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text('Topic: ${data.topic}',
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(
            //   height: 5,
            // ),
            // Text('Description: ${data.description}',
            // style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.bold,
            //   ),),
            // SizedBox(height: 7),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                            onPressed: () {
                              // SfPdfViewer.network(data.link.toString());
                              final url = data.link.toString();
                              // const url =
                              //     'https://drive.google.com/file/d/13dUAuIg0N0dERSW7SbSCpgS3vq0zE8o7/view?usp=share_link';
                              launch(url);
                            },
                            label: const Text(
                              'Click to view',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10
                              ),
                            ),
                            icon: const Icon(Icons.picture_as_pdf, size: 17,),
                            backgroundColor: Color.fromARGB(255, 227, 179, 179),
                          ),
                
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
