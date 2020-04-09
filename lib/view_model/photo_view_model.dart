import 'package:cdd_mobile_frontend/model/photo.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';

class PhotoViewModel extends ViewStateModel {
  List<Photo> _photos;

  List<Photo> get photos => _photos;

  getAllPhotos(int petId) async {
    setBusy();
    var response = await APIRepository.getAllPhotos({
      "pet_id": petId,
    });
    if (response.statusCode != 200) return false;
    var res = response.data['data'] as List;
    _photos = res.map((item) => Photo.fromJson(item)).toList();
    setIdle();
    return true;
  }
}
