import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_planning.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class ShowPlanningServices {
  String? _message;
  String? get message => _message;

  Future<ShowPlanning?> getShowPlanning(int index) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning/$index');
      print(response.data);
      if (response.statusCode == 200) {
        return ShowPlanning.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      return null;
    }
  }
}
