import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/realization.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class RealizationServices {
  String? _message;
  String? get message => _message;

  Future<Realization?> getRealizationData({int? page}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response =
          await dio.get('/realization', queryParameters: {"page": page});
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Realization.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error $e");
      return null;
    }
  }

  Future<bool> deleteItem(int index) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.delete(
        '/item/$index',
      );
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
