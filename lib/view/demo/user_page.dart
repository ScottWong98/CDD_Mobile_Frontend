import 'dart:ui';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300 + MediaQuery.of(context).padding.top,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            floating: true,
            pinned: false,
            flexibleSpace: UserHeaderWidget(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListItemWidget(
                listTitle: "编辑个人资料",
                listPrefixIcon: Icons.edit,
              ),
              ListItemWidget(
                listTitle: "系统设置",
                listPrefixIcon: Icons.settings,
              ),
              ListItemWidget(
                listTitle: "帮助",
                listPrefixIcon: Icons.help,
              ),
              ListItemWidget(
                listTitle: "关于我们",
                listPrefixIcon: Icons.info_outline,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: SizedBox(
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "退出登录",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UserBottomClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8e2de2), Color(0xFF4a00e0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/pictures/people.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Scott Wong",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              "You have a dream, you got to protect it",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TagWidget(tagTitle: "宠物", tagValue: "0"),
                TagWidget(tagTitle: "动态", tagValue: "0"),
                TagWidget(tagTitle: "关注", tagValue: "0"),
                TagWidget(tagTitle: "粉丝", tagValue: "0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var p1 = Offset(size.width / 2, size.height);
    var p2 = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TagWidget extends StatelessWidget {
  final tagTitle, tagValue;
  const TagWidget({Key key, this.tagTitle, this.tagValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Text(
            tagTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            tagValue,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final listTitle, listPrefixIcon;
  const ListItemWidget({Key key, this.listTitle, this.listPrefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(listTitle, style: TextStyle(color: Colors.black)),
      leading: Icon(listPrefixIcon, color: Color(0xBF4a00e0)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black26),
    );
  }
}
