import 'package:cdd_mobile_frontend/model/pet.dart';
import 'package:cdd_mobile_frontend/model/user.dart';
import 'package:cdd_mobile_frontend/provider/view_state_model.dart';
import 'package:cdd_mobile_frontend/service/api_repository.dart';

class UserViewModel extends ViewStateModel {
  User _user;
  List<Pet> _pets;

  User get user => _user;
  List<Pet> get pets => _pets;

  // 登录
  Future<bool> login(String account, String password) async {
    var response = await APIRepository.login({
      "account": account,
      "password": password,
    });

    if (response.statusCode != 200) {
      return false;
    }
    print(response.data);
    _user = User.fromJson(response.data["data"]);

    // 根据用户Id获取宠物列表
    var petResponse = await APIRepository.getAllPets({
      "user_id": _user.id,
    });
    var res = petResponse.data["data"] as List;
    _pets = res.map((item) => Pet.fromJson(item)).toList();
    return true;
  }

  // 重新获取宠物列表
  Future<bool> getAllPets() async {
    var response = await APIRepository.getAllPets({
      "user_id": _user.id,
    });
    var res = response.data["data"] as List;
    _pets = res.map((item) => Pet.fromJson(item)).toList();
    notifyListeners();
    return true;
  }

  // 添加宠物
  Future<bool> addPet(String nickName, String species, String introduction,
      DateTime createTime) async {
    Pet pet = Pet(
        userId: _user.id,
        nickName: nickName,
        species: species,
        introduction: introduction,
        createTime: createTime,
        avatar: species == "cat"
            ? "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2072494435,853546208&fm=26&gp=0.jpg"
            : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586352534050&di=93dcb769a0a8c8e7670a29167a9ca6c9&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn07%2F788%2Fw500h288%2F20180522%2Fe9df-hawmaua4747221.jpg");
    var response = await APIRepository.addPet(pet.toJson());
    print(response.statusCode);
    _user.petNumber++;
    pet = Pet.fromJson(response.data["data"]);
    _pets.add(pet);
    notifyListeners();
    return true;
  }

  // 删除宠物
  Future<bool> deletePet(int petId, int index) async {
    print("pet id : $petId, index: $index");
    var response = await APIRepository.deletePet({
      "petId": petId,
      "userId": _user.id,
    });
    print(response.statusCode);
    _user.petNumber--;
    _pets.removeAt(index);
    notifyListeners();
    return true;
  }

  Future<bool> updatePetInfo(
      int index, String nickName, String introduction) async {
    Pet pet = pets[index];
    pet.nickName = nickName;
    pet.introduction = introduction;
    var response = await APIRepository.updatePetInfo(pet.toJson());
    if (response.statusCode != 200) return false;
    notifyListeners();
    return true;
  }

  // 宠物日记
  changeDiaryNumber(int petIndex, int value) async {
    pets[petIndex].diaryNumber += value;
    notifyListeners();
  }
}