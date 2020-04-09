import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/bill/update_bill_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/weight/update_weight_page.dart';
import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/weight_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowWeightPage extends StatefulWidget {
  final petId, petIndex, weightIndex;
  ShowWeightPage({Key key, this.petIndex, this.petId, this.weightIndex})
      : super(key: key);

  @override
  _ShowWeightPageState createState() => _ShowWeightPageState();
}

class _ShowWeightPageState extends State<ShowWeightPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Consumer2<WeightViewModel, UserViewModel>(
              builder: (context, weightVM, userVM, child) {
                final _weight = weightVM.weights[widget.weightIndex];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${_weight.weightValue}Kg",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "时间：${FormatDate.getTimeInYMD(_weight.createTime)}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("提示"),
                                      content: Text("确认删除吗？"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("取消"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("确认"),
                                          onPressed: () async {
                                            var res =
                                                await weightVM.deleteWeight(
                                              _weight.id,
                                              widget.petId,
                                            );
                                            if (res == true) {
                                              await userVM.getAllPets();
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Text(
                              "删除",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return UpdateWeightPage(
                                      weightIndex: widget.weightIndex,
                                      petId: widget.petId,
                                      petIndex: widget.petIndex,
                                      oldValue: _weight.weightValue.toString(),
                                      oldDate: FormatDate.getTimeInYMD(
                                          _weight.createTime),
                                    );
                                  });
                            },
                            child: Text(
                              "更新",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
