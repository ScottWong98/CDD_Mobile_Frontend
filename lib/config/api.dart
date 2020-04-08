import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: "http://scotty.ink:8080",
  connectTimeout: 5000,
  receiveTimeout: 5000,
);
final Dio dio = Dio(options);
