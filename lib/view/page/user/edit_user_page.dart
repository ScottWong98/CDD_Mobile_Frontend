import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_page.dart';

class Edituser extends StatefulWidget {
  final userId, nickName, introduction;
  Edituser({Key key, this.userId, this.nickName, this.introduction})
      : super(key: key);

  @override
  _EdituserState createState() => _EdituserState();
}

class _EdituserState extends State<Edituser> {
  final _nickNameController = TextEditingController();
  final _introductionController = TextEditingController();

  @override
  void initState() {
    _nickNameController.text = widget.nickName;
    _introductionController.text = widget.introduction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("编辑个人资料"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {
                  var status = await userVM.updateUser(
                      _nickNameController.text, _introductionController.text);
                  if (status == true) Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _nickNameController,
                    decoration: InputDecoration(labelText: "昵称"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _introductionController,
                    decoration: InputDecoration(labelText: "介绍"),
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
