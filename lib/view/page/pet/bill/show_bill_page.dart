import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/bill/update_bill_page.dart';
import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';

class ShowBillPage extends StatefulWidget {
  final petId, petIndex, costIndex;
  ShowBillPage({Key key, this.petIndex, this.petId, this.costIndex})
      : super(key: key);

  @override
  _ShowBillPageState createState() => _ShowBillPageState();
}

class _ShowBillPageState extends State<ShowBillPage> {
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
            child: Consumer2<CostViewModel, UserViewModel>(
              builder: (context, costVM, userVM, child) {
                final _cost = costVM.costs[widget.costIndex];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "内容：${costVM.costs[widget.costIndex].content}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "金额：￥${costVM.costs[widget.costIndex].costValue}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "时间：${FormatDate.getTimeInYMD(costVM.costs[widget.costIndex].createTime)}",
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
                                            var res = await costVM.deleteCost(
                                                _cost.id, widget.petId);
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
                                    return UpdateBillPage(
                                      costIndex: widget.costIndex,
                                      petId: widget.petId,
                                      petIndex: widget.petIndex,
                                      oldContent: _cost.content,
                                      oldValue: _cost.costValue.toString(),
                                      oldDate: FormatDate.getTimeInYMD(
                                          _cost.createTime),
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
