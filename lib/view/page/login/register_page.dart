import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, @required this.screenH, @required this.screenW})
      : super(key: key);
  final screenH;
  final screenW;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var h = widget.screenH;
    var w = widget.screenW;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: (h + h / 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
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
              //下方白框
              BoxWidget(
                w: w,
                h: h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxWidget extends StatefulWidget {
  final w, h;
  BoxWidget({Key key, this.w, this.h}) : super(key: key);

  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  final _unameController = new TextEditingController();
  final _pwdController = new TextEditingController();
  final _pwdConfirmController = new TextEditingController();
  final _nickNameController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final w = widget.w, h = widget.h;
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(w / 7, w / 7)),
          ),
          child: SizedBox(
            height: (h - h / 8),
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: RaisedButton.icon(
                        color: Colors.blueAccent,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        label: Text(
                          "返回",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/");
                        },
                        shape: new StadiumBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _unameController,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "请输入用户名",
                          icon: Icon(Icons.person)),
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "请输入密码",
                          icon: Icon(Icons.lock)),
                      obscureText: true,
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _pwdConfirmController,
                      decoration: InputDecoration(
                          labelText: "确认密码",
                          hintText: "请输入密码",
                          icon: Icon(Icons.lock_outline)),
                      obscureText: true,
                      validator: (v) {
                        return v == _pwdController.text ? null : "与密码不同";
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _nickNameController,
                      decoration: InputDecoration(
                          labelText: "昵称", icon: Icon(Icons.person_outline)),
                      // obscureText: true,
                      validator: (v) {
                        return v == _nickNameController.text ? null : "昵称不能为空";
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("注册"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () async {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  print("验证通过 提交数据");
                                  print("用户名：${_unameController.text}");
                                  print("密码：${_pwdController.text}");
                                  print("昵称：${_nickNameController.text}");
                                  var status = await userVM.register(
                                      _unameController.text,
                                      _pwdController.text,
                                      _nickNameController.text);
                                  if (status == true)
                                    Navigator.of(context)
                                        .pushReplacementNamed("/");
                                } else {
                                  print("验证不通过");
                                }
                              },
                              shape: new StadiumBorder(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
