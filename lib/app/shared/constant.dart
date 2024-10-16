import 'package:dio/dio.dart';

var uri = "https://payroll.humicprototyping.com/api";
BaseOptions options = BaseOptions(
    baseUrl: uri,
// ignore: missing_return
    validateStatus: (code) {
      if (code! >= 200) {
        return true;
      }
      return false;
    });
Dio dio = Dio(options);
