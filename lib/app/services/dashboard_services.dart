import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class DashboardServices {
  String? _message;
  String? get message => _message;
  Future<Dashboard?> getDashboardData() async {
    try {
      // dio.options.headers['Authorization'] =
      //     'Bearer ${GetStorage().read('token')}';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/dashboard');
      print(response.data);
      if (response.statusCode == 200) {
        return Dashboard.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";

      return null;
    }
  }
}
