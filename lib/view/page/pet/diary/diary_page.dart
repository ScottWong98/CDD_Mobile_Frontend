import 'package:cdd_mobile_frontend/util/format_date.dart';
import 'package:cdd_mobile_frontend/view/page/pet/diary/add_diary_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/diary/show_diary_page.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Color> colorList = [
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.cyan,
  Colors.amberAccent,
  Colors.purpleAccent,
  Colors.redAccent,
];

class DiaryPage extends StatefulWidget {
  final petIndex;
  final petName;
  final petId;
  final petAvatar;
  DiaryPage({Key key, this.petIndex, this.petName, this.petId, this.petAvatar})
      : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  void initState() {
    Provider.of<DiaryViewModel>(context, listen: false)
        .getAllDiaries(widget.petId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _diaryVM = Provider.of<DiaryViewModel>(context);
    return _diaryVM.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            // backgroundColor: Colors.greenAccent,
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddDiaryPage(
                              petIndex: widget.petIndex,
                              petId: widget.petId,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                  flexibleSpace: Container(
                    color: Colors.greenAccent,
                    child: FlexibleSpaceBar(
                      background: Image.network(
                        widget.petAvatar,
                        fit: BoxFit.cover,
                      ),
                      title: Text(widget.petName),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  snap: true,
                ),
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print("tap $index");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShowDiaryPage(
                                petId: widget.petId,
                                petIndex: widget.petIndex,
                                index: index,
                                color: colorList[index % colorList.length],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.date_range),
                                  Text(
                                    _diaryVM.diaries[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    FormatDate.getTimeInYMD(
                                        _diaryVM.diaries[index].createTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: colorList[index % colorList.length]),
                        ),
                      ),
                    ),
                    childCount: _diaryVM.length,
                  ),
                  itemExtent: 100,
                ),
              ],
            ),
          );
  }
}
