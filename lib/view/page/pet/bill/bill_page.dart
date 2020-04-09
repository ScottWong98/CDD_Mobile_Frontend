import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/bill/add_bill_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/bill/show_bill_page.dart';
import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Color> colorList = [
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.cyan,
  Colors.amberAccent,
  Colors.purpleAccent,
  Colors.redAccent,
];

class BillPage extends StatefulWidget {
  final petIndex, petId;
  BillPage({Key key, this.petIndex, this.petId}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  void initState() {
    Provider.of<CostViewModel>(context, listen: false)
        .getAllCosts(widget.petId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _costVM = Provider.of<CostViewModel>(context);
    return _costVM.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("账单"),
              centerTitle: true,
              backgroundColor: Colors.orangeAccent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddBillPage(
                          petIndex: widget.petIndex,
                          petId: widget.petId,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _costVM.costs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowBillPage(
                                      costIndex: index,
                                      petId: widget.petId,
                                      petIndex: widget.petIndex,
                                    );
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: colorList[index % colorList.length],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 30,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.date_range),
                                        Text(
                                          "￥${_costVM.costs[index].costValue}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          FormatDate.getTimeInYMD(
                                              _costVM.costs[index].createTime),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
  }
}

/*
class BillPage extends StatefulWidget {
  BillPage({Key key, @required this.name}) : super(key: key);
//  WeightPage({Key key, this.arguments}) : super(key: key);
//  final Map arguments;

  var name;
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  String _chart_type = 'week';
  var items = new List<String>.generate(100, (i) => "Items $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text.rich(TextSpan(children: [
          TextSpan(
            text: "${widget.name}",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          TextSpan(
            text: "的账单记录",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )
        ])),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            PetBillChart(type: _chart_type),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
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
            Container(
              decoration: BoxDecoration(
                color: Colors.limeAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 60,
                    width: 200,
                    margin: EdgeInsets.only(top: 10.0),
                    child: new RaisedButton(
                      onPressed: () {
                        showDialog<Null>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return new SimpleDialog(
                                title: new Text('请输入新的纪录'),
                                children: <Widget>[
                                  new TextField(
                                    decoration: InputDecoration(
                                      hintText: '请输入消费金额/元',
                                      contentPadding: EdgeInsets.all(10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  new TextField(
                                    decoration: InputDecoration(
                                      hintText: '请输入消费去向',
                                      contentPadding: EdgeInsets.all(10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  new RaisedButton(
                                      child: new Text('确定'),
                                      color: Colors.limeAccent,
                                      onPressed: () {}),
                                ],
                              );
                            });
                      },
                      color: Colors.lightBlue,
                      child: new Text('添加'),
                    ),
                  ),
                  new Container(
                    height: 230,
                    child: new ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new ListTile(
                            title: new Text('${items[index]}'),
                            //subtitle: new Text('999'),
                            //trailing: Icon(Icons.keyboard_arrow_right),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
