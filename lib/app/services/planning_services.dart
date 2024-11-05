import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning_input.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class PlanningServices {
  String? _message;
  String? get message => _message;

  Future<Planning?> getPlanningData() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning');
      print(response.data);
      if (response.statusCode == 200) {
        return Planning.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      return null;
    }
  }
}
