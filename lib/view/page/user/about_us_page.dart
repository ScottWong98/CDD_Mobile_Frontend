import 'package:flutter/material.dart';
import 'user_page.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '关于我们',
        ),
        centerTitle: true,
      ),
      body: Center(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.grey, Colors.white],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '猫狗日记项目',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text("https://github.com/OreoWorkstation/CDD_Mobile_Frontend"),
          ],
        ),
      ),
    );
  }
}
