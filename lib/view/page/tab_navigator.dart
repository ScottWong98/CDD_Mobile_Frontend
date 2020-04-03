import 'package:cdd_mobile_frontend/view/page/community/community_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/pet_page.dart';
import 'package:cdd_mobile_frontend/view/page/user/user_page.dart';
import 'package:cdd_mobile_frontend/view/page/wiki/wiki_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> pages = <Widget>[
  PetPage(),
  WikiPage(),
  CommunityPage(),
  UserPage(),
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          createItem(Icon(Icons.pets), "宠物"),
          createItem(Icon(Icons.book), "百科"),
          createItem(Icon(Icons.blur_circular), "社区"),
          createItem(Icon(Icons.account_box), "个人"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );
  }
}

BottomNavigationBarItem createItem(Icon icon, String title) {
  return BottomNavigationBarItem(
    icon: icon,
    title: Text(title),
  );
}
