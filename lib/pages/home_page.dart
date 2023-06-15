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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  // QuerySnapshot collection = value;
                  // List<QueryDocumentSnapshot> docs = collection.docs;
                  // QueryDocumentSnapshot doc = docs[0];
                  // print(doc.id);
                  // print(doc.data());
                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    print(element.id);
                    print(element.data());
                    //Convirtiendo objeto a Map<String, dynamic>
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                  });
                });
              },
              child: Text("Obtener la data"),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.add({
                  "title": "Ir de compras al super 2",
                  "description": "Debemos comprar comida pra el mes",
                }).then((DocumentReference value){
                  print(value.id);
                }).catchError((error){
                  print("Ocurrio un error en el registro");
                }).whenComplete((){
                  print("Registro terminado");
                });
              },
              child: Text(
                "Agregar docuemnto",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("8QGBfySyRKdsZSRiUn5V").update({
                  "title": "Ir de compras al super 222",
                  "description": "Debemos comprar comida pra el mes 222",
                }).catchError((error){
                  print("Ocurrio un error en el registro");
                }).whenComplete((){
                  print("Registro actualizado");
                });
              },
              child: Text(
                "Actualizar docuemnto",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("8QGBfySyRKdsZSRiUn5V")
                .delete()
                .catchError((error){
                  print("Ocurrio un error en el registro");
                }).whenComplete((){
                  print("Eliminacion actualizado");
                });
              },
              child: Text(
                "Eliminar docuemnto",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("A0001")
                .set({
                  "title": "Ir de compras al super 333",
                  "description": "Debemos comprar comida pra el mes 333",
                })
                .catchError((error){
                  print("Ocurrio un error en el registro");
                }).whenComplete((){
                  print("Creacion completada");
                });
              },
              child: Text(
                "Agregar docuemnto personalizado",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
