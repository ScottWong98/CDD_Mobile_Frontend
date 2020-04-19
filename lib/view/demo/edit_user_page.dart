import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  EditUserPage({Key key}) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Change Color
        backgroundColor: Color(0xDF4a00e0),
        elevation: 0,
        title: Text("编辑"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            // TODO: Change Icon
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: <Widget>[
              _EditItemWidget(
                title: "头像",
                content: ClipOval(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/pictures/people.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Divider(height: 40),
              _EditItemWidget(
                title: "昵称",
                // TODO: fix input
                content: Text(
                  "ScottWong",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Divider(height: 40),
              _EditItemWidget(
                title: "签名",
                // TODO: fix input
                content: Text(
                  "You have a dream, you got protect it,",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Divider(height: 40),
              _EditItemWidget(
                title: "性别",
                content: Text(
                  "男",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Divider(height: 40),
              _EditItemWidget(
                title: "生日",
                content: Text(
                  "1998-10-06",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Divider(height: 40),
              _EditItemWidget(
                title: "家乡",
                content: Text(
                  "安徽省 阜阳市",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditItemWidget extends StatelessWidget {
  final title, content;
  const _EditItemWidget({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              content,
              SizedBox(width: 20),
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
