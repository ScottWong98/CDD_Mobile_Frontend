import 'package:cdd_mobile_frontend/util/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/weight/add_weight_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/weight/pet_weight_chart.dart';
import 'package:cdd_mobile_frontend/view/page/pet/weight/show_weight_page.dart';
import 'package:cdd_mobile_frontend/view/widget/chart.dart';
import 'package:cdd_mobile_frontend/view_model/weight_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cdd_mobile_frontend/util/generate_chart_data.dart';

final List<Color> colorList = [
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.cyan,
  Colors.amberAccent,
  Colors.purpleAccent,
  Colors.redAccent,
];

class WeightPage extends StatefulWidget {
  final petIndex, petId;
  WeightPage({Key key, this.petIndex, this.petId}) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  @override
  void initState() {
    Provider.of<WeightViewModel>(context, listen: false)
        .getAllWeights(widget.petId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _weightVM = Provider.of<WeightViewModel>(context);

    return _weightVM.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("体重"),
              centerTitle: true,
              backgroundColor: Colors.orangeAccent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddWeightPage(
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
                  // color: Colors.blueAccent,
                  child: CustomChart(createWeightData(_weightVM.weights)),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _weightVM.weights.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowWeightPage(
                                      weightIndex: index,
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
                                          "${_weightVM.weights[index].weightValue}Kg",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          FormatDate.getTimeInYMD(_weightVM
                                              .weights[index].createTime),
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
*/
