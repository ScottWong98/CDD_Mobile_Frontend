import 'package:cdd_mobile_frontend/view/widget/bottom_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200 + MediaQuery.of(context).padding.top,
            flexibleSpace: ClipPath(
              clipper: BottomClipper(),
              child: Container(
                // child: FlexibleSpaceBar(
                //   title: Text("demo"),
                // ),
                color: Colors.orangeAccent,
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [Colors.blue[300], Colors.blueAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ]),
          ),
          // Center(
          //   child: Text("Hello"),
          // )
        ],
      ),
    );
  }
}
