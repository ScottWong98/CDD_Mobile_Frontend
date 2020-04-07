import 'package:cdd_mobile_frontend/view/page/pet/weight/pet_weight_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget{
  WeightPage({Key key, @required this.name}) : super(key: key);
//  WeightPage({Key key, this.arguments}) : super(key: key);
//  final Map arguments;
  var name;
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  String _chart_type = 'week';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: "${widget.name}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            TextSpan(
              text: "的体重记录",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
              ),
            )
          ]
        )),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            PetWeightChart(type: _chart_type),
            Row(
              children: <Widget>[
                Expanded(
                  flex : 1,
                  child: RadioListTile<String>(
                    value: 'week',
                    title: Text('周'),
                    groupValue: _chart_type,
                    onChanged: (value) {
                      setState(() {
                        _chart_type = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RadioListTile<String>(
                    value: 'month',
                    title: Text('月'),
                    groupValue: _chart_type,
                    onChanged: (value) {
                      setState(() {
                        _chart_type = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RadioListTile<String>(
                    value: 'year',
                    title: Text('年'),
                    groupValue: _chart_type,
                    onChanged: (value) {
                      setState(() {
                        _chart_type = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

