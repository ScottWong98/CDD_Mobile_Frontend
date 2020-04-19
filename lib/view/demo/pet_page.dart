import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PetPage extends StatefulWidget {
  PetPage({Key key}) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xfff9f4f0),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/pictures/pet_header.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 200),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "宠物列表",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.blue[800]),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 250,
                    // color: Colors.grey,
                    child: Swiper(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.orange,
                        );
                      },
                      itemCount: 4,
                      viewportFraction: 0.6,
                      scale: 0.9,
                      loop: false,
                      // scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
