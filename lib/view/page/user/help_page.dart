import 'package:flutter/material.dart';
import 'user_page.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '帮助',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '敬请期待',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
