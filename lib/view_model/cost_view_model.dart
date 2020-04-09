import 'package:cdd_mobile_frontend/model/cost.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';

class CostViewModel extends ViewStateModel {
  List<Cost> _costs;

  List<Cost> get costs => _costs;

  Future<bool> getAllCosts(int petId) async {
    setBusy();
    var response = await APIRepository.getAllCosts({
      "pet_id": petId,
    });
    if (response.statusCode != 200) return false;
    var res = response.data['data'] as List;
    print(res.length);
    _costs = res.map((item) => Cost.fromJson(item)).toList();
    setIdle();
    return true;
  }

  Future<bool> addCost(int petId, String costContent, String costValue,
      DateTime createTime) async {
    Cost cost = Cost(
      id: 0,
      petId: petId,
      content: costContent,
      costValue: double.parse(costValue),
      createTime: createTime,
    );
    var response = await APIRepository.addCost(cost.toJson());
    if (response.statusCode != 200) return false;
    await getAllCosts(petId);
    return true;
  }

  Future<bool> deleteCost(int costId, int petId) async {
    var response = await APIRepository.deleteCost({
      "costId": costId,
      "petId": petId,
    });
    if (response.statusCode != 200) return false;
    await getAllCosts(petId);
    return true;
  }

  Future<bool> updateCost(int costIndex, int petId, String costContent,
      String costValue, DateTime createTime) async {
    Cost cost = Cost(
      id: costs[costIndex].id,
      petId: petId,
      content: costContent,
      costValue: double.parse(costValue),
      createTime: createTime,
    );
    var response = await APIRepository.updateCost(cost.toJson());
    if (response.statusCode != 200) return false;
    costs[costIndex] = cost;
    notifyListeners();
    return true;
  }
}
