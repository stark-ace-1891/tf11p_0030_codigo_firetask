import 'package:flutter/material.dart';
import 'package:tf11p_0030_codigo_firetask/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firetask",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
