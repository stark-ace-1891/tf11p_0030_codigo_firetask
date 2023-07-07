import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection("tasks");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6ff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 22,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenido Cesar"),
                    Text("Mis tareas"),
                    TextField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // body: StreamBuilder(
      //   stream: tasksReference.snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot snap) {
      //     if (snap.hasData) {
      //       QuerySnapshot collection = snap.data;
      //       List<QueryDocumentSnapshot> docs = collection.docs;
      //       List<Map<String, dynamic>> docsMap =
      //           docs.map((e) => e.data() as Map<String, dynamic>).toList();

      //       return ListView.builder(
      //         itemCount: docsMap.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return ListTile(
      //             title: Text(docsMap[index]["title"]),
      //           );
      //         },
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
