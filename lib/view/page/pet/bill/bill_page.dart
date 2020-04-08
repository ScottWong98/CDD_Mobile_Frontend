import 'package:cdd_mobile_frontend/view/page/pet/bill/pet_bill_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget{
  BillPage({Key key, @required this.name}) : super(key: key);
//  WeightPage({Key key, this.arguments}) : super(key: key);
//  final Map arguments;
  var name;
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
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
                text: "的账单记录",
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
            PetBillChart(type: _chart_type),
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

