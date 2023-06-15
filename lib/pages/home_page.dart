import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection("tasks");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Firestore"),
        ),
        body: StreamBuilder(
          stream: tasksReference.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              QuerySnapshot collection = snap.data;
              List<QueryDocumentSnapshot> docs = collection.docs;
              List<Map<String, dynamic>> docsMap =
                  docs.map((e) => e.data() as Map<String, dynamic>).toList();

              return ListView.builder(
                itemCount: docsMap.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(docsMap[index]["title"]),
                  );
                },
              );
              // return ListView.builder(
              //   itemCount: docsMap.length,
              //   itemBuilder: (BuildContext context, int index){
              //     return Text(docsMap[index]["title"]);
              //   },
              // );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        // body: FutureBuilder(
        //   future: getNumber(),
        //   builder: (BuildContext conext, AsyncSnapshot snap){
        //     return Text(snap.data.toString());
        //   },
        // ),
        );
  }
}
