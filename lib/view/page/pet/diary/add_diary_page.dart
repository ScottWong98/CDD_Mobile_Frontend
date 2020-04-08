import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDiaryPage extends StatelessWidget {
  const AddDiaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryViewModel>(
      builder: (context, diaryVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text(FormatDate.getTimeInYMD(DateTime.now())),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
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
                    decoration: InputDecoration(hintText: "输入日记标题..."),
                  ),
                  TextField(
                    maxLines: null,
                    decoration:
                        InputDecoration.collapsed(hintText: "输入日记内容..."),
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
