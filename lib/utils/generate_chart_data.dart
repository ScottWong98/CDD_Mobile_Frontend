import 'package:cdd_mobile_frontend/model/cost.dart';
import 'package:cdd_mobile_frontend/model/weight.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Sample time series data type.
class MyRow {
  final DateTime timeStamp;
  final double headcount;
  MyRow(this.timeStamp, this.headcount);
}

List<MyRow> getItem(List<Cost> lists) {
  List<MyRow> res;
  for (var item in lists) {
    var time = item.createTime;
    res.add(MyRow(DateTime(time.year, time.month, time.day), item.costValue));
  }
  res.reversed;
  return res;
}

List<charts.Series<MyRow, DateTime>> createCostData(List<Cost> lists) {
  List<MyRow> data = [];
  for (var item in lists) {
    var time = item.createTime;
    print(time.year);
    data.add(MyRow(DateTime(time.year, time.month, time.day), item.costValue));
  }
  data.reversed;

  return [
    new charts.Series<MyRow, DateTime>(
      id: 'Headcount',
      domainFn: (MyRow row, _) => row.timeStamp,
      measureFn: (MyRow row, _) => row.headcount,
      data: data,
    )
  ];
}

List<charts.Series<MyRow, DateTime>> createWeightData(List<Weight> lists) {
  List<MyRow> data = [];
  for (var item in lists) {
    var time = item.createTime;
    print(time.year);
    data.add(
        MyRow(DateTime(time.year, time.month, time.day), item.weightValue));
  }
  data.reversed;

  return [
    new charts.Series<MyRow, DateTime>(
      id: 'Headcount',
      domainFn: (MyRow row, _) => row.timeStamp,
      measureFn: (MyRow row, _) => row.headcount,
      data: data,
    )
  ];
}
