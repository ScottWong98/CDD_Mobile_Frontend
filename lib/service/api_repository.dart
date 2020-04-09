import 'package:cdd_mobile_frontend/config/api.dart';
import 'package:dio/dio.dart';

class APIRepository {
  // 登录
  static Future<Response> login(var params) async {
    var response = await dio.get("/user/login", queryParameters: params);
    return response;
  }

  // 注册
  static Future<Response> register(var data) async {
    return await dio.post("/user/register", data: data);
  }

  // 更新用户信息
  static Future<Response> updateUser(var data) async {
    return await dio.put("/user", data: data);
  }

  // 根据用户ID获取所有宠物
  static Future<Response> getAllPets(var params) async {
    return await dio.get("/pet", queryParameters: params);
  }

  // 修改宠物基本信息
  static Future<Response> updatePetInfo(var data) async {
    return await dio.put("/pet", data: data);
  }

  // 更新宠物头像
  static Future<Response> updatePetAvatar(var data) async {
    return await dio.put("/pet", data: data);
  }

  // 添加宠物
  static Future<Response> addPet(var data) async {
    return await dio.post("/pet", data: data);
  }

  // 删除宠物
  static Future<Response> deletePet(var data) async {
    return await dio.delete("/pet", data: data);
  }

  // 添加日记
  static Future<Response> addDiary(var data) async {
    return await dio.post("/diary", data: data);
  }

  // 删除日记
  static Future<Response> deleteDiary(var data) async {
    return await dio.delete("/diary", data: data);
  }

  // 获取所有日记
  static Future<Response> getAllDiaries(var params) async {
    return await dio.get("/diary", queryParameters: params);
  }

  // 更新日记信息
  static Future<Response> updateDiary(var data) async {
    return await dio.put("/diary", data: data);
  }

  // 添加体重信息
  static Future<Response> addWeight(var data) async {
    return await dio.post("/weight", data: data);
  }

  // 删除体重信息
  static Future<Response> deleteWeight(var data) async {
    return await dio.delete("/weight", data: data);
  }

  // 根据宠物ID获取所有体重信息
  static Future<Response> getAllWeights(var params) async {
    return await dio.get("/weight", queryParameters: params);
  }

  // 更新体重信息
  static Future<Response> updateWeight(var data) async {
    return await dio.put("/weight", data: data);
  }

  // 添加消费记录
  static Future<Response> addCost(var data) async {
    return await dio.post("/cost", data: data);
  }

  // 删除消费记录
  static Future<Response> deleteCost(var data) async {
    return await dio.delete("/cost", data: data);
  }

  // 根据宠物Id获取所有消费记录
  static Future<Response> getAllCosts(var params) async {
    return await dio.get("/cost", queryParameters: params);
  }

  // 更新消费信息
  static Future<Response> updateCost(var data) async {
    return await dio.put("/cost", data: data);
  }

  // 获取所有相片
  static Future<Response> getAllPhotos(var params) async {
    return await dio.get("/photo", queryParameters: params);
  }
}
