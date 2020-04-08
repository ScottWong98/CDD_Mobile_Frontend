import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDiaryPage extends StatelessWidget {
  final index, color;
  const ShowDiaryPage({Key key, this.index, this.color = Colors.greenAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryViewModel>(
      builder: (context, diaryVM, child) {
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
                    icon: Icon(Icons.edit),
                    onPressed: () {},
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
