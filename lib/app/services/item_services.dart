import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';

class AddItemServices {
  String? _message;
  String? get message => _message;

  Future<bool> addItemPlanning({required AddItem item}) async {
    try {
      Dio dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      final response = await dio.post(
        'http://localhost:8000/api/item',
        data: item.toJson(),
      );

      if (response.statusCode == 201) {
        _message = "Item berhasil ditambahkan";
        return true;
      } else {
        _message = "Gagal menambahkan item: ${response.statusCode}";
        return false;
      }
    } catch (e) {
      _message = "Error: $e";
      return false;
    }
  }
}
