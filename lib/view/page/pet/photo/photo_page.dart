import 'package:cdd_mobile_frontend/view_model/photo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatefulWidget {
  final petId;
  PhotoPage({Key key, this.petId}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  void initState() {
    Provider.of<PhotoViewModel>(context).getAllPhotos(widget.petId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _photoVM = Provider.of<PhotoViewModel>(context);
    return _photoVM.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.greenAccent,
              title: Text("相片"),
              centerTitle: true,
            ),
            body: Flexible(
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                children: <Widget>[],
              ),
            ),
          );
  }
}
