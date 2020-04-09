import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text("修改日记"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.backspace),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                  ),
                  TextField(
                    controller: _contentController,
                    maxLines: null,
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
