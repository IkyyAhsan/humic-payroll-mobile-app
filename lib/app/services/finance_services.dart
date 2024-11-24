import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income.dart';
import '../shared/constant.dart';

class FinanceServices {
  String? _message;
  String? get message => _message;

  Future<UserIncome?> getFinance() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      // Permintaan GET ke API user profile
      final response = await dio.get('/pending');
      print("data ${response.data}");
      if (response.statusCode == 200) {
        // Jika berhasil, parsing JSON menjadi UserProfile
        return UserIncome.fromJson(response.data);
      } else {
        _message = "Failed to load profile: ${response.statusCode}";
        return null;
      }
    } catch (e) {
      _message = "Error: $e";
      return null;
    }
  }

  Future<bool> updateStatusFinance(
      {required int id, required String status}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.post('/finance/$id', data: {"status": status});
      if (response.statusCode == 200) {
        return true;
      }
      print(response.data);

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteFinance({int? id}) async {
    try {
      var response = await dio.delete('/finance/$id');
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
