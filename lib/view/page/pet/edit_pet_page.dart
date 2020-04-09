import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPetPage extends StatefulWidget {
  final petIndex;
  final nickName, introduction;
  EditPetPage({Key key, this.petIndex, this.nickName, this.introduction})
      : super(key: key);

  @override
  _EditPetPageState createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditPetPage> {
  final _nickNameController = TextEditingController();
  final _introController = TextEditingController();

  @override
  void initState() {
    _nickNameController.text = widget.nickName;
    _introController.text = widget.introduction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("修改宠物信息"),
            centerTitle: true,
            backgroundColor: Colors.greenAccent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {
                  bool res = await userVM.updatePetInfo(widget.petIndex,
                      _nickNameController.text, _introController.text);
                  if (res == true) Navigator.of(context).pop();
                },
              ),
            ],
          ),
          // body: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   child: Container(
          //     margin: EdgeInsets.only(top: 40),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         TextField(
          //           controller: _nickNameController,
          //           decoration: InputDecoration(
          //             labelText: "NickName",
          //           ),
          //         ),
          //         TextField(
          //           controller: _introController,
          //           decoration: InputDecoration(
          //             labelText: "Introduction",
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    icon: Icon(Icons.pets),
                    labelText: '宠物名称',
                  ),
                  onSaved: (val) {
                    _nickNameController.text = val;
                  },
                  validator: (val) {
                    return val.length > 0 ? null : "名称不能为空";
                  },
                  controller: _nickNameController,
                ),
                SizedBox(
                  height: h / 30,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                      labelText: '宠物描述', icon: Icon(Icons.description)),
                  onSaved: (val) {
                    _introController.text = val;
                  },
                  controller: _introController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
