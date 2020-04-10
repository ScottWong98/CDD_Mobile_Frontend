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
        child: Text('猫狗日记项目'),
      ),
    );
  }
}
