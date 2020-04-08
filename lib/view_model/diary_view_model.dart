import 'package:cdd_mobile_frontend/model/diary.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';

class DiaryViewModel extends ViewStateModel {
  List<Diary> _diaries;

  int get length => _diaries.length;
  List<Diary> get diaries => _diaries;

  getAllDiaries(int petId) async {
    setBusy();
    var response = await APIRepository.getAllDiaries({
      "pet_id": petId,
    });
    print(response);
    var res = response.data["data"] as List;
    _diaries = res.map((item) => Diary.fromJson(item)).toList();
    setIdle();
    print(diaries);
  }
}
