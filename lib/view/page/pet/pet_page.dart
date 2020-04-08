import 'package:cdd_mobile_frontend/view/page/pet/add_pet_page.dart';
import 'package:cdd_mobile_frontend/view/page/pet/pet_borad_component.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'pet_overview_page.dart';

class PetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.blueAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: SafeArea(
            child: Container(),
          ),
        ),
        PetNumberWidget(),
        PetManageWidget(),
      ],
    );
  }
}

class PetNumberWidget extends StatelessWidget {
  const PetNumberWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Container(
          padding: EdgeInsets.only(top: h / 7, left: w / 20),
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "已经拥有宠物",
              style: TextStyle(color: Colors.white, fontSize: w / 9),
            ),
            TextSpan(
              text: "${userVM.pets.length}",
              style: TextStyle(
                  color: Colors.white70, fontFamily: 'italic', fontSize: w / 9),
            ),
            TextSpan(
              text: "只",
              style: TextStyle(color: Colors.white, fontSize: w / 9),
            ),
          ])),
        );
      },
    );
  }
}

class PetManageWidget extends StatefulWidget {
  PetManageWidget({Key key}) : super(key: key);

  @override
  _PetManageWidgetState createState() => _PetManageWidgetState();
}

class _PetManageWidgetState extends State<PetManageWidget> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: h / 3.5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(30, 30)),
          ),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: double.infinity,
              ),
              child: Container(
                  child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      //“宠物  + 号按钮”
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: w / 12, top: h / 39),
                          child: Text(
                            "宠物",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Courier",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w / 3.6, top: h / 39),
                          child: OutlineButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddPetPage(),
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                            label: Text(
                              "添加我的宠物",
                              style: TextStyle(fontSize: h / 50),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 8,
                    child: PetListWidget(),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ))),
        ),
      ),
    );
  }
}

class PetListWidget extends StatefulWidget {
  PetListWidget({Key key}) : super(key: key);

  @override
  _PetListWidgetState createState() => _PetListWidgetState();
}

class _PetListWidgetState extends State<PetListWidget> {
  void addPet() {}

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            height: h / 2,
            child: userVM.pets.length == 0
                ? Center(
                    child: FloatingActionButton(
                      child: Icon(Icons.add, size: h / 15.5),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddPetPage(),
                          ),
                        );
                      },
                    ),
                  )
                : Swiper(
                    scale: 0.9,
                    viewportFraction: 0.8,
                    itemBuilder: (BuildContext context, int index) =>
                        PetBoard(index: index), //Pet Board
                    itemCount: userVM.pets.length,
                    scrollDirection: Axis.horizontal,
                    loop: false,
                    autoplay: false,
                    onIndexChanged: (index) {
                      print("$index");
                      debugPrint("index:$index");
                    },
                    onTap: (index) {
                      var nowname = userVM.pets[index].nickName;
                      debugPrint("点击了第:$index个 它叫$nowname");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PetOverviewPage(
                            index: index,
                          ),
                        ),
                      );
                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: h / 78),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
