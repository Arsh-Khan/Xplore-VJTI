import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/utilites/reg_no_tod_diya_jaye.dart';

class ParticipantSeniorAdviceView extends StatefulWidget {
  const ParticipantSeniorAdviceView({super.key});

  @override
  State<ParticipantSeniorAdviceView> createState() =>
      _ParticipantSeniorAdviceViewState();
}

class _ParticipantSeniorAdviceViewState
    extends State<ParticipantSeniorAdviceView> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    log(data.toString());

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: MongoSeniorAdviceDatabase.distinctQueryData(),
                builder: (context, snapshot) {
                  log(snapshot.data.toString() + "why this null");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData = snapshot.data!.length;
                      log(totalData.toString());
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return displayCard(MongoDbSeniorAdviceModel.fromJson(
                              snapshot.data![index]));
                        },
                      );
                    } else {
                      return Center(
                        child: Text('No data available'),
                      );
                    }
                  }
                })),
      ),
    );
  }

  Widget displayCard(MongoDbSeniorAdviceModel data) {
    // final detailsfromregId = detailsFromRegID(userdetails['regId']);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${data.id}'),
              Text('~${data.status}'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${data.name}"),
              Text("${data.year}"),
            ],
          ),
        ]),
      ),
    );
  }
}
