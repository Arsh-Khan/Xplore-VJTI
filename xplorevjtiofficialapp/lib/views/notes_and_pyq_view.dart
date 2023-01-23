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
      appBar: AppBar(actions: [
        Row(
          children: [
            IconButton(
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
                icon: Icon(Icons.add_box_outlined),
                tooltip: 'Insert Notes or PYQ'),
            IconButton(
                onPressed: () async {
                  final userdata = await userDetails();
                  Navigator.pushNamed(context, updateNotesAndPyqRoute,
                      arguments: userdata['email'].toString());
                },
                tooltip: 'Update Notes or PYQ',
                icon: Icon(Icons.update)),
            IconButton(
                onPressed: () async {
                  final userdata = await userDetails();
                  Navigator.of(context).pushNamed(deleteNotesAndPyqRoute,
                      arguments: userdata['email'].toString());
                },
                tooltip: 'Delete Notes',
                icon: Icon(Icons.delete)),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, notesAndPyqRoute, (route) => false);
                  });
                },
                tooltip: 'Refresh Page',
                icon: Icon(Icons.refresh)),
          ],
        )
      ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return displayCard(MongoDbNotesAndPyqModel.fromJson(
                              snapshot.data![index]));
                        },
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
    );
  }

  Widget displayCard(MongoDbNotesAndPyqModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Published On : ${data.timeofsubmission}'),
          SizedBox(
            height: 5,
          ),
          Text("Name: ${data.name}"),
          SizedBox(
            height: 5,
          ),
          Text("Email: ${data.email}"),
          SizedBox(
            height: 5,
          ),
          Text("Type: ${data.notesANDpyqs}"),
          SizedBox(
            height: 5,
          ),
          Text("Year: ${data.year}"),
          SizedBox(
            height: 5,
          ),
          Text('Subject: ${data.subject}'),
          SizedBox(
            height: 5,
          ),
          Text('Topic: ${data.topic}'),
          SizedBox(
            height: 5,
          ),
          Text('Description: ${data.description}'),
          SizedBox(height: 7),
          IconButton(
            onPressed: () {
              // SfPdfViewer.network(data.link.toString());
              final url = data.link.toString();
              // const url =
              //     'https://drive.google.com/file/d/13dUAuIg0N0dERSW7SbSCpgS3vq0zE8o7/view?usp=share_link';
              launch(url);
            },
            icon: Icon(Icons.picture_as_pdf),
          ),
        ]),
      ),
    );
  }
}
