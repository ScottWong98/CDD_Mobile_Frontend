import 'package:cdd_mobile_frontend/view/page/user/edit_user_page.dart';
import 'package:cdd_mobile_frontend/view/page/user/system_setting_page.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_us_page.dart';
import 'help_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFfbab66), Color(0xFFf7418c)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 50,
              ),
            ),
            MyRowFirst(),
            SizedBox(
              height: 10,
            ),
            MyRowSecond(),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    MyContainer(),
                    MyRowThird(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRowFirst extends StatelessWidget {
  const MyRowFirst({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0.0, left: 20.0),
              width: 100.0,
              height: 100.0,
              //color: Colors.lightGreenAccent,
              child: ClipOval(
                child: Image.network(
                  userVM.user.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  // margin: EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0),
                  padding: EdgeInsets.all(0.0),
                  // height: 50.0,
                  child: new Text(userVM.user.nickName,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 20,
                ),
                new Container(
                  // margin: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  padding: EdgeInsets.all(0.0),
                  // height: 50.0,
                  child: new Text(userVM.user.introduction,
                      style: new TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.start),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

//四个分区栏
class MyRowSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: new MyPet(),
        ),
        new Expanded(
          flex: 1,
          child: new MyAction(),
        ),
        new Expanded(
          flex: 1,
          child: new MyFork(),
        ),
        new Expanded(
          flex: 1,
          child: new MyFans(),
        ),
      ],
    );
  }
}

//退出登陆
class MyRowThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(
            top: 20.0,
          ),
          width: 200,
          //color: Colors.lime,
          child: new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            color: Colors.redAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: new Text(
              '退出登陆',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

//中间四个列
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new MyEdit(),
          new MySetting(),
          new MyHelp(),
          new MyMessage(),
        ],
      ),
    );
  }
}

class MyEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new Edituser(
                  nickName: userVM.user.nickName,
                  introduction: userVM.user.introduction,
                ),
              ),
            );
          },
          child: new Container(
            child: new Text(
              '编辑个人资料',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            padding: EdgeInsets.all(0.0),
            height: 50.0,
            margin: EdgeInsets.only(left: 30),
          ),
        );
      },
    );
  }
}

//系统设置
class MySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new Systemsetting()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '系统设置',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//帮助
class MyHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => new Help()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '帮助',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//关于我们
class MyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Aboutus()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '关于我们',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//宠物
class MyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.deepPurpleAccent,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text(
                '宠物',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Consumer<UserViewModel>(
              builder: (context, userVM, child) {
                return new Expanded(
                  child: new Text(
                    '${userVM.user.petNumber}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//动态
class MyAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text(
                '动态',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            new Expanded(
              child: new Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//关注
class MyFork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.black87,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text(
                '关注',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            new Expanded(
              child: new Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//粉丝
class MyFans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.limeAccent,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text(
                '粉丝',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            new Expanded(
              child: new Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
