import 'package:flutter/material.dart';

class ShowDiaryPage extends StatelessWidget {
  const ShowDiaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 104, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print("press edit button");
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("提示"),
                  content: Text("这是编辑日记按钮"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('确认'),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Diay Name",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          DiaryContent(),
        ],
      ),
    );
  }
}

class DiaryContent extends StatelessWidget {
  const DiaryContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Text("这是日记内容"),
      ),
    );
  }
}
