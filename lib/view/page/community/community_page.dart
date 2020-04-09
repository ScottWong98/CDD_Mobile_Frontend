import 'package:cdd_mobile_frontend/view/widget/bottom_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 200 + MediaQuery.of(context).padding.top,
            // flexibleSpace: ClipPath(
            //   clipper: BottomClipper(),
            //   child: Container(
            //     color: Colors.orangeAccent,
            //     child: Center(
            //       child: Text("hee"),
            //     ),
            //   ),
            // ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              )
            ],
            flexibleSpace: Container(
              color: Colors.greenAccent,
              child: FlexibleSpaceBar(
                title: Text("Hhhh"),
                background: Image.network(
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2072494435,853546208&fm=26&gp=0.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            pinned: true,
            snap: true,
            floating: true,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: colorList[index],
                ),
              ),
              childCount: colorList.length,
            ),
            itemExtent: 100,
          ),
        ],
      ),
    );
  }
}
