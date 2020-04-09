import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetBoard extends StatefulWidget {
  final index;
  PetBoard({Key key, @required this.index}) : super(key: key);
  final boardColors = [
    Colors.orange,
    Colors.blueAccent,
    Colors.cyan,
    Colors.green,
    Colors.deepPurpleAccent
  ];

  @override
  _PetBoardState createState() => _PetBoardState();
}

class _PetBoardState extends State<PetBoard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height; //780
    final _userVM = Provider.of<UserViewModel>(context);
    return DecoratedBox(
      decoration: BoxDecoration(
          color: widget.boardColors[widget.index % widget.boardColors.length],
          borderRadius: BorderRadius.circular(15.0)),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(
                      "  " + _userVM.pets[widget.index].species,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: h / 39,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Material(
                        //borderRadius: BorderRadius.circular(),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        child: IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  //提示以达到上限
                                  return new AlertDialog(
                                    title: new Text("提示"),
                                    content: new Text("您确认要删除该宠物么？"),
                                    actions: <Widget>[
                                      new FlatButton(
                                          onPressed: () {
                                            _userVM.deletePet(
                                                _userVM.pets[widget.index].id,
                                                widget.index);
                                            print("删除宠物");
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text("确认")),
                                      new FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text("取消"))
                                    ],
                                  );
                                });
                          },
                        ),
                      ))
                ],
              )),
          Expanded(
              flex: 3,
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    _userVM.pets[widget.index].avatar,
                    height: h / 5.5,
                    width: h / 5.5,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(_userVM.pets[widget.index].nickName,
                    style: TextStyle(
                      fontSize: h / 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  _userVM.pets[widget.index].introduction,
                  style: TextStyle(
                    fontSize: h / 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                  child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                    FormatDate.getTimeInYMD(
                        _userVM.pets[widget.index].createTime),
                    style: TextStyle(
                      fontSize: h / 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              )))
        ],
      ),
    );
  }
}
