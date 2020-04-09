import 'package:cdd_mobile_frontend/model/weight.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';

class WeightViewModel extends ViewStateModel {
  List<Weight> _weights;

  List<Weight> get weights => _weights;

  getAllWeights(int petId) async {
    setBusy();
    var response = await APIRepository.getAllWeights({
      "pet_id": petId,
    });
    if (response.statusCode != 200) return false;
    var res = response.data['data'] as List;
    _weights = res.map((item) => Weight.fromJson(item)).toList();
    setIdle();
    return true;
  }

  addWeight(int petId, String weightValue, DateTime createTime) async {
    Weight weight = Weight(
      id: 0,
      petId: petId,
      weightValue: double.parse(weightValue),
      createTime: createTime,
    );
    var response = await APIRepository.addWeight(weight.toJson());
    if (response.statusCode != 200) return false;
    await getAllWeights(petId);
    return true;
  }

  deleteWeight(int weightId, int petId) async {
    var response = await APIRepository.deleteWeight({
      "weightId": weightId,
      "petId": petId,
    });
    if (response.statusCode != 200) return false;
    await getAllWeights(petId);
    return true;
  }

  updateWeight(int weightIndex, int petId, String weightValue,
      DateTime createTime) async {
    Weight weight = Weight(
      id: weights[weightIndex].id,
      petId: petId,
      weightValue: double.parse(weightValue),
      createTime: createTime,
    );
    var response = await APIRepository.updateWeight(weight.toJson());
    if (response.statusCode != 200) return false;
    getAllWeights(petId);
    // notifyListeners();
    return true;
  }
}
