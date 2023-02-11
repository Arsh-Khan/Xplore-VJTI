import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';

class SearchNotesAndPyqDisplay extends StatefulWidget {
  const SearchNotesAndPyqDisplay({super.key});

  @override
  State<SearchNotesAndPyqDisplay> createState() =>
      _SearchNotesAndPyqDisplayState();
}

class _SearchNotesAndPyqDisplayState extends State<SearchNotesAndPyqDisplay> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchParameters =
        ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: MongoNotesAndPyqDatabase.notesAndPyqSearch(
            'notesANDpyqs',
            searchParameters['notesANDpyqs'],
            'year',
            searchParameters['year'],
            'branch',
            searchParameters['branch']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return displayData(
                      // MongoDbNotesAndPyqModel.fromJson(snapshot.data![index]));
                      MongoDbNotesAndPyqModel.fromJson(snapshot.data![index]));
                },
              );
            } else {
              return Center(
                child: Text("Data Not Found"),
              );
            }
          }
        },
      )),
    );
  }

  Widget displayData(MongoDbNotesAndPyqModel data) {
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: '${data.timeofsubmission}',
                      style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: '\nName: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: "${data.name}", style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: "\nEmail: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: "${data.email}",
                      style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: "\nType: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: "${data.notesANDpyqs}",
                      style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: "\nYear: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: "${data.year}", style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: "\nBranch: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: "${data.branch}",
                      style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: '\nSubject: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: '${data.subject}',
                      style: TextStyle(
                          letterSpacing: 1, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '\nTopic: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: '${data.topic}',
                      style: TextStyle(letterSpacing: 1)),
                  TextSpan(
                      text: '\nDescription: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 177, 8, 8),
                      )),
                  TextSpan(
                      text: '${data.description}',
                      style: TextStyle(letterSpacing: 1)),
                ])),
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
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
                  ),
                  icon: const Icon(
                    Icons.picture_as_pdf,
                    size: 17,
                  ),
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
