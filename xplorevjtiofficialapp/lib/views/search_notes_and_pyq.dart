import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/constants/app_constants.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class SearchNotesAndPyqPreviewView extends StatefulWidget {
  const SearchNotesAndPyqPreviewView({super.key});

  @override
  State<SearchNotesAndPyqPreviewView> createState() =>
      _SearchNotesAndPyqPreviewViewState();
}

class _SearchNotesAndPyqPreviewViewState
    extends State<SearchNotesAndPyqPreviewView> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  late final TextEditingController _notesorpyq;
  late final TextEditingController _branch;
  late final TextEditingController _year;
  String notesorpyq = "";
  String year = "";
  String branch = "";

  @override
  void initState() {
    _notesorpyq = TextEditingController();
    _year = TextEditingController();
    _branch = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _notesorpyq.dispose();
      _branch.dispose();
      _year.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, notesAndPyqRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 124, 5, 5),
              size: 30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 5, 20, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      setState(() {});
                    },
                    tooltip: 'Refresh Page',
                    icon: const Icon(
                      Icons.refresh,
                      color: Color.fromARGB(255, 124, 5, 5),
                      size: 30,
                    )),
              ],
            ),
          ),
        ],
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
        child: Column(children: [
          const SizedBox(height: 20),
          Text('Search',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 124, 5, 5),
              )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(103, 236, 183, 183),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Select Notes / PYQs : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 5, 5),
                                  fontSize: 15,
                                  fontFamily: 'Poppins')),
                          const SizedBox(width: 20),
                          DropdownButton(
                            dropdownColor: Colors.deepOrange[50],
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: notespyqs.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                notesorpyq = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Select branch : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 5, 5),
                                  fontSize: 15,
                                  fontFamily: 'Poppins')),
                          const SizedBox(width: 20),
                          DropdownButton(
                            dropdownColor: Colors.deepOrange[50],
                            value: branchesvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: branches.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                branchesvalue = newValue!;
                                branch = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      const Text(
                        'NOTE : Please select \'ALL\' if you are FY',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        )
                        ),
                      Row(
                        children: [
                          Text('Select year : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 5, 5),
                                  fontSize: 15,
                                  fontFamily: 'Poppins')),
                          const SizedBox(width: 20),
                          DropdownButton(
                            dropdownColor: Colors.deepOrange[50],
                            value: defaultyear,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: selectyear.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                defaultyear = newValue!;
                                year = newValue;
                              });
                            },
                          ),
                        ],
                      ),

                      // ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.find_in_page),
                      //     label: Text('Search')),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   child: SafeArea(
                      //       child: SingleChildScrollView(
                      //     child: FutureBuilder(
                      //       future: MongoNotesAndPyqDatabase.notesAndPyqSearch(
                      //           'notesANDpyqs',
                      //           _notesorpyq.text,
                      //           'year',
                      //           _year.text,
                      //           'branch',
                      //           _branch.text),
                      //       builder: (context, snapshot) {
                      //         if (snapshot.connectionState ==
                      //             ConnectionState.waiting) {
                      //           return Center(
                      //             child: CircularProgressIndicator(),
                      //           );
                      //         } else {
                      //           if (snapshot.data!.length == 0 &&
                      //               _notesorpyq.text != '' &&
                      //               _branch.text != '' &&
                      //               _year.text != "") {
                      //             return Center(
                      //               child: Text("OOPS No Data Available!"),
                      //             );
                      //           } else if (snapshot.hasData) {
                      //             return ListView.builder(
                      //               physics: NeverScrollableScrollPhysics(),
                      //               shrinkWrap: true,
                      //               itemCount: snapshot.data!.length,
                      //               itemBuilder: (context, index) {
                      //                 return displayData(
                      //                     // MongoDbNotesAndPyqModel.fromJson(snapshot.data![index]));
                      //                     MongoDbNotesAndPyqModel.fromJson(
                      //                         snapshot.data![index]));
                      //               },
                      //             );
                      //           } else {
                      //             return Center(
                      //               child: Text("Data Not Found"),
                      //             );
                      //           }
                      //         }
                      //       },
                      //     ),
                      //   )),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          FloatingActionButton.extended(
            heroTag: 'btn-1',
            onPressed: () {
              if (notesorpyq == "" || branch == "" || year == "") {
                String error = "";
                if (notesorpyq == "") {
                  error += "Select Notes or PYQ";
                }
                if (branch == "") {
                  error += "\nSelect Branch";
                }
                if (year == "") {
                  error += "\nSelect Year";
                }
                showErrorDiaglog(context, error);
              }
              setState(() {
                setState(() {
                  _notesorpyq.text = notesorpyq;
                  _branch.text = branch;
                  _year.text = year;
                });
              });
            },
            label: const Text('Search'),
            icon: const Icon(Icons.find_in_page),
            backgroundColor: const Color.fromARGB(255, 124, 5, 5),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(103, 236, 183, 183),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: MongoNotesAndPyqDatabase.notesAndPyqSearch(
                        'notesANDpyqs',
                        _notesorpyq.text,
                        'year',
                        _year.text,
                        'branch',
                        _branch.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.data!.length == 0 &&
                            _notesorpyq.text != '' &&
                            _branch.text != '' &&
                            _year.text != "") {
                          return Center(
                            child: Text("OOPS No Data Available!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 124, 5, 5),
                              fontFamily: 'Poppins',
                            )
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return displayData(
                                  // MongoDbNotesAndPyqModel.fromJson(snapshot.data![index]));
                                  MongoDbNotesAndPyqModel.fromJson(
                                      snapshot.data![index]));
                            },
                          );
                        } else {
                          return Center(
                            child: Text("Data Not Found"),
                          );
                        }
                      }
                    },
                  ),
                )),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
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

  // Widget searchParameters(String notesorpyq, String branch, String year) {
  //   return;
  // }
}
