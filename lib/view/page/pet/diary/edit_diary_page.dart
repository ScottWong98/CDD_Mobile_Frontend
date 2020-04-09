import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDiaryPage extends StatefulWidget {
  final petId;
  final title, content;
  final diaryIndex;
  EditDiaryPage(
      {Key key, this.diaryIndex, this.petId, this.title, this.content})
      : super(key: key);

  @override
  _EditDiaryPageState createState() => _EditDiaryPageState();
}

class _EditDiaryPageState extends State<EditDiaryPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _sizedBoxSpace = SizedBox(height: 24);

  @override
  void initState() {
    _titleController.text = widget.title;
    _contentController.text = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryViewModel>(
      builder: (context, diaryVM, child) {
        final _diary = diaryVM.diaries[widget.diaryIndex];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text("修改日记"),
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
                  print(_titleController.text);
                  print(_contentController.text);
                  var val = await diaryVM.updateDiary(
                      widget.diaryIndex,
                      widget.petId,
                      _titleController.text,
                      _contentController.text);
                  if (val == true) {
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
              //     ),
              //     TextField(
              //       controller: _contentController,
              //       maxLines: null,
              //     ),
              //   ],
              // ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${_diary.createTime.day}",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 30),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "星期${_diary.createTime.weekday}",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            "${_diary.createTime.year}年${_diary.createTime.month}月",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                  _sizedBoxSpace,
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      // filled: true,
                      icon: Icon(Icons.assignment),
                      labelText: "日记标题",
                    ),
                    controller: _titleController,
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
