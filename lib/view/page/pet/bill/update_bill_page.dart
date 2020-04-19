import 'package:cdd_mobile_frontend/util/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';

class UpdateBillPage extends StatefulWidget {
  final petId, petIndex, costIndex;
  final oldContent, oldValue, oldDate;
  const UpdateBillPage(
      {Key key,
      this.petId,
      this.petIndex,
      this.costIndex,
      this.oldDate,
      this.oldContent,
      this.oldValue})
      : super(key: key);

  @override
  _UpdateBillPageState createState() => _UpdateBillPageState();
}

class _UpdateBillPageState extends State<UpdateBillPage> {
  final _costContentController = TextEditingController();
  final _costValueController = TextEditingController();
  var _costDate = FormatDate.getTimeInYMD(DateTime.now());
  var _costDateFormat = DateTime.now();

  @override
  void initState() {
    _costContentController.text = widget.oldContent;
    _costValueController.text = widget.oldValue;
    _costDate = widget.oldDate;
    _costDateFormat = DateTime.parse(_costDate);
    print(_costDateFormat);
    print(_costDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_costDate);
    print(_costContentController.text);
    print(_costValueController.text);
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "更新账单",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _costContentController,
                    decoration: InputDecoration(
                      labelText: "消费去向",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _costValueController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[0-9.]"))
                    ],
                    decoration: InputDecoration(
                      prefixText: "￥",
                      labelText: "消费金额",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "消费日期:",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        child: Text(
                          _costDate,
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          Picker(
                            hideHeader: true,
                            adapter: DateTimePickerAdapter(),
                            title: Text("选择日期"),
                            selectedTextStyle: TextStyle(color: Colors.blue),
                            onConfirm: (Picker picker, List value) {
                              setState(() {
                                _costDateFormat =
                                    (picker.adapter as DateTimePickerAdapter)
                                        .value;
                                _costDate = FormatDate.getTimeInYMD(
                                    (picker.adapter as DateTimePickerAdapter)
                                        .value);
                              });
                            },
                          ).showDialog(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "取消",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Consumer2<CostViewModel, UserViewModel>(
                          builder: (context, costVM, userVM, child) {
                            return RaisedButton(
                              onPressed: () async {
                                print(widget.petId);
                                print(_costContentController.text);
                                print(_costValueController.text);
                                print(_costDateFormat);
                                // var status = await costVM.addCost(
                                //     widget.petId,
                                //     _costContentController.text,
                                //     _costValueController.text,
                                //     _costDateFormat);
                                var status = await costVM.updateCost(
                                    widget.costIndex,
                                    widget.petId,
                                    _costContentController.text,
                                    _costValueController.text,
                                    _costDateFormat);
                                print(status);
                                if (status == true) {
                                  await userVM.getAllPets();
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                "更新",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
