import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection("tasks");

  Stream<int> counter() async* {
    for (var i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Future<int> getNumber() async {
    return 1000;
  }

  @override
  Widget build(BuildContext context) {
    counter().listen((event) {
      print(event);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: StreamBuilder(
        stream: counter(),
        builder: (BuildContext conext, AsyncSnapshot snap) {
          if (snap.hasData) {
            int data = snap.data;
            return Center(
              child: Text(
                data.toString(),
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: FutureBuilder(
      //   future: getNumber(),
      //   builder: (BuildContext conext, AsyncSnapshot snap){
      //     return Text(snap.data.toString());
      //   },
      // ),
    );
  }
}
