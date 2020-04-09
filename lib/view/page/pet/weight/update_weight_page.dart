import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/weight_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';

class UpdateWeightPage extends StatefulWidget {
  final petId, petIndex, weightIndex;
  final oldValue, oldDate;
  const UpdateWeightPage({
    Key key,
    this.weightIndex,
    this.petId,
    this.petIndex,
    this.oldDate,
    this.oldValue,
  }) : super(key: key);

  @override
  _UpdateWeightPageState createState() => _UpdateWeightPageState();
}

class _UpdateWeightPageState extends State<UpdateWeightPage> {
  final _weightValueController = TextEditingController();
  var _weightDate = FormatDate.getTimeInYMD(DateTime.now());
  var _weightDateFormat = DateTime.now();

  @override
  void initState() {
    _weightValueController.text = widget.oldValue;
    _weightDate = widget.oldDate;
    _weightDateFormat = DateTime.parse(_weightDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    "更新体重",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _weightValueController,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[0-9.]"))
                    ],
                    decoration: InputDecoration(
                      suffixText: "Kg",
                      labelText: "体重值",
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
                        "日期:",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        child: Text(
                          _weightDate,
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
                                _weightDateFormat =
                                    (picker.adapter as DateTimePickerAdapter)
                                        .value;
                                _weightDate = FormatDate.getTimeInYMD(
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
                        Consumer2<WeightViewModel, UserViewModel>(
                          builder: (context, weightVM, userVM, child) {
                            return RaisedButton(
                              onPressed: () async {
                                var status = await weightVM.updateWeight(
                                    widget.weightIndex,
                                    widget.petId,
                                    _weightValueController.text,
                                    _weightDateFormat);
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
