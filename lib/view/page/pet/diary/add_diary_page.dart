import 'package:cdd_mobile_frontend/util/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDiaryPage extends StatelessWidget {
  final petIndex;
  final petId;
  const AddDiaryPage({Key key, this.petIndex, this.petId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> _diaryFormKey = new GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _contentController = TextEditingController();
    final _date = DateTime.now();
    const _sizedBoxSpace = SizedBox(height: 24);

    // String _title;
    // String _content;

    // void _forSubmitted() {
    //   if (_diaryFormKey.currentState.validate()) {
    //     var _form = _diaryFormKey.currentState;
    //     if (_form.validate()) {
    //       _form.save();
    //       print(_title);
    //       print(_content);
    //     }
    //     Navigator.pop(context);
    //   }
    // }

    return Consumer2<DiaryViewModel, UserViewModel>(
      builder: (context, diaryVM, userVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text(FormatDate.getTimeInYMD(DateTime.now())),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  var val = await diaryVM.addDiary(
                      petId, _titleController.text, _contentController.text);
                  if (val == true) {
                    await userVM.changeDiaryNumber(petIndex, 1);
                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.save),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     TextField(
              //       controller: _titleController,
              //       decoration: InputDecoration(hintText: "输入日记标题..."),
              //     ),
              //     TextField(
              //       controller: _contentController,
              //       maxLines: null,
              //       decoration:
              //           InputDecoration.collapsed(hintText: "输入日记内容..."),
              //     ),
              //   ],
              // ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${_date.day}",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 30),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "星期${_date.weekday}",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            "${_date.year}年${_date.month}月",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  _sizedBoxSpace,
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.assignment),
                      hintText: "${_date.year}-${_date.month}-${_date.day}",
                      labelText: "日记标题",
                    ),
                    controller: _titleController,
                    // onSaved: (val) {
                    //   _title = val;
                    // },
                    //  controller: widget.title == null ? null :               //若没有传参数 无
                    //       TextEditingController.fromValue(TextEditingValue(        //传了参数    设置默认值
                    //         text:
                    //             '${this._title == null ? "${widget.title}" : this._title}', //判断keyword是否为空
                    //       ))
                  ),
                  _sizedBoxSpace,
                  TextField(
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "无论忙碌还是闲暇,为你的宠物记录吧",
                      labelText: "日记内容",
                    ),
                    maxLines: 10,
                    controller: _contentController,
                    // controller: _contentController,
                    // onSaved: (val) {
                    //   _content = val;
                    // },
                    // controller: widget.content == null ? null :                  //若没有传参数 无
                    // TextEditingController.fromValue(TextEditingValue(            //传了参数    设置默认值
                    //   text:
                    //   '${this._content == null ? "${widget.content}" : this._content}',
                    // ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
