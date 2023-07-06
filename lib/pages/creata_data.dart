import 'package:flutter/material.dart';
class CreateData extends StatelessWidget {
  static String get id => "create_data";
  const CreateData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Creata Data"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "title",
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "body",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: null, child: Text("Creata"))
          ],
        ),
      ),
    );
  }
}
