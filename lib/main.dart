import 'package:arxitektura_1/pages/creata_data.dart';
import 'package:arxitektura_1/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HomePage(),
          routes: {
        CreateData.id : (context) => CreateData(),
    },
    );
  }
}

