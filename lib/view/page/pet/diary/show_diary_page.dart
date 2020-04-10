import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/diary/edit_diary_page.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDiaryPage extends StatelessWidget {
  final index, color, petId, petIndex;
  const ShowDiaryPage(
      {Key key,
      this.petId,
      this.petIndex,
      this.index,
      this.color = Colors.greenAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<DiaryViewModel, UserViewModel>(
      builder: (context, diaryVM, userVM, child) {
        final _diary = diaryVM.diaries[index];
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 200 + MediaQuery.of(context).padding.top,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("提示"),
                          content: Text("确定删除这篇日记吗？"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () async {
                                var response =
                                    await diaryVM.deleteDiary(index, petId);
                                if (response == true) {
                                  await userVM.changeDiaryNumber(petIndex, -1);
                                  Navigator.of(context).pop();
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text("确认"),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("取消"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditDiaryPage(
                            diaryIndex: index,
                            petId: petId,
                            title: _diary.title,
                            content: _diary.content,
                          ),
                        ),
                      );
                    },
                  ),
                ],
                flexibleSpace: Container(
                  color: color,
                  child: FlexibleSpaceBar(
                    title: Text(
                      _diary.title == ""
                          ? FormatDate.getTimeInYMD(_diary.createTime)
                          : _diary.title,
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _diary.content,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DiaryContent extends StatelessWidget {
  final content;
  const DiaryContent({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Text(content),
    );
  }
}
