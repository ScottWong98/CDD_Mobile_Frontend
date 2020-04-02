import 'package:flutter/material.dart';

class AddDiaryPage extends StatelessWidget {
  const AddDiaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Diary"),
      ),
      body: Center(
        child: Text(
          "这是添加日记界面",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
