import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/constants/app_constants.dart';

class SearchNotesAndPyqPreviewView extends StatefulWidget {
  const SearchNotesAndPyqPreviewView({super.key});

  @override
  State<SearchNotesAndPyqPreviewView> createState() =>
      _SearchNotesAndPyqPreviewViewState();
}

class _SearchNotesAndPyqPreviewViewState
    extends State<SearchNotesAndPyqPreviewView> {
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
      body: Column(children: [
        Text('Search View',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 124, 5, 5),
            )),
        SizedBox(
          height: 10,
        ),
        // Text('Search Notes and Pyq',
        //     style: TextStyle(
        //       fontFamily: 'Poppins',
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromARGB(255, 124, 5, 5),
        //     )),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        });
                      },
                    ),
                  ],
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
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.find_in_page),
                    label: Text('Search')),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
