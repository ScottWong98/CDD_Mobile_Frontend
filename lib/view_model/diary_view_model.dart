import 'package:cdd_mobile_frontend/model/diary.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';

class DiaryViewModel extends ViewStateModel {
  List<Diary> _diaries;

  DiaryViewModel();

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

  Future<bool> addDiary(int petId, String title, String content) async {
    // setBusy();
    Diary diary = Diary(
      id: 0,
      petId: petId,
      title: title,
      content: content,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );
    var response = await APIRepository.addDiary(diary.toJson());
    if (response.statusCode != 200) return false;
    // setIdle();
    Diary newDiary = Diary.fromJson(response.data['data']);
    print(newDiary.id);
    diaries.insert(0, newDiary);
    notifyListeners();
    return true;
  }

  updateDiary(int diaryIndex, int petId, String title, String content) async {
    Diary diary = Diary(
      id: diaries[diaryIndex].id,
      petId: petId,
      title: title,
      content: content,
      createTime: diaries[diaryIndex].createTime,
      updateTime: diaries[diaryIndex].updateTime,
    );
    print(diary.toJson());
    var response = await APIRepository.updateDiary(diary.toJson());
    if (response.statusCode != 200) return false;
    diaries[diaryIndex] = diary;
    notifyListeners();
    return true;
  }

  deleteDiary(int diaryIndex, int petId) async {
    var response = await APIRepository.deleteDiary({
      "diaryId": _diaries[diaryIndex].id,
      "petId": petId,
    });
    if (response.statusCode != 200) return false;
    _diaries.removeAt(diaryIndex);
    notifyListeners();
    return true;
  }
}
