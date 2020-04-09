import 'package:cdd_mobile_frontend/view/widget/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WikiPage extends StatelessWidget {
  const WikiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Container(
        child: CustomChart.withSampleData(),
        height: MediaQuery.of(context).size.height * 0.5,
      ),
    );
  }
}
