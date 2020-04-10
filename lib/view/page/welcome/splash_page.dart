import 'package:cdd_mobile_frontend/view/page/login/login_page.dart';
import 'package:cdd_mobile_frontend/view/page/login/register_page.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width; //360
    final h = MediaQuery.of(context).size.height; //780
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.indigo, Colors.blue[600], Colors.indigo],
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: h / 8,
                  ),
                  SizedBox(
                    height: h / 8,
                    width: double.infinity,
                    child: Center(
                      child: Icon(
                        Icons.pets,
                        size: h / 9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 8,
                    child: Center(
                      child: Text(
                        "猫狗日记",
                        style: TextStyle(
                          fontSize: h / 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(6, 3),
                                blurRadius: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                  BoxWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width; //360
    final h = MediaQuery.of(context).size.height; //780
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: SizedBox(
          height: h - 3 * h / 8,
          width: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: h / 6,
                ),
                SizedBox(
                  width: w - 60,
                  height: h / 15.5,
                  child: FlatButton(
                    shape: new StadiumBorder(
                        side: new BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.indigo,
                    )),
                    child: Text(
                      '登陆',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: w / 18,
                          letterSpacing: w / 18),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(screenH: h, screenW: w),
                        ),
                      );
                    },
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: h / 12,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: w / 2,
                        height: h / 15.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: FlatButton(
                            shape: new StadiumBorder(
                                side: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.indigo,
                            )),
                            child: Text(
                              '注册',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: w / 18,
                                  letterSpacing: w / 18),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterPage(screenH: h, screenW: w),
                                ),
                              );
                            },
                          ),
                        )),
                    SizedBox(
                        width: w / 2,
                        height: h / 15.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: FlatButton(
                            shape: new StadiumBorder(
                                side: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.indigo,
                            )),
                            child: Text(
                              '忘记密码',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: w / 18,
                                  letterSpacing: 2),
                            ),
                            onPressed: () {
                              // setState(() {
                              //   print("忘记密码按钮");
                              // });
                            },
                          ),
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
