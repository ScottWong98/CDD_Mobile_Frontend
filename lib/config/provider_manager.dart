import 'package:cdd_mobile_frontend/view_model/cost_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/photo_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/weight_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => UserViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => DiaryViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => CostViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => WeightViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => PhotoViewModel(),
  ),
];
