import 'package:flutter/material.dart';
import 'user_page.dart';

class Systemsetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '系统设置',
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
