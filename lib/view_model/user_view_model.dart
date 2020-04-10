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

  // 注册
  Future<bool> register(
      String account, String password, String nickName) async {
    User user = User(
      id: 0,
      account: account,
      password: password,
      nickName: nickName,
      gender: 0,
      address: "Qingdao, China",
      avatar:
          "http://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/wapiknow/wh=450,600/sign=86859c04f203918fd78435ce640d0aa1/9f510fb30f2442a73c913641d443ad4bd01302b3.jpg",
      introduction: "you need to add an introduction",
      petNumber: 0,
    );
    var response = await APIRepository.register(user.toJson());
    if (response.statusCode != 200) return false;
    // user = User.fromJson(response.data['data']);
    return true;
  }

  // 更新用户信息
  Future<bool> updateUser(String nickName, String introduction) async {
    user.nickName = nickName;
    user.introduction = introduction;
    var response = await APIRepository.updateUser(user.toJson());
    if (response.statusCode != 200) return false;
    notifyListeners();
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
            : "http://5b0988e595225.cdn.sohucs.com/images/20180310/52524f396f704b9a9bf636ce1e72bfbe.jpeg");
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
