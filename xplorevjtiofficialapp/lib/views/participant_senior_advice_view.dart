import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: MongoSeniorAdviceDatabase.queryData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData = snapshot.data!.length;
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${data.id}'),
              Text('${data.status}'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${data.name}"),
              Text("2 Year"),
              Text('EXTC'),
            ],
          ),
        ]),
      ),
    );
  }
}
