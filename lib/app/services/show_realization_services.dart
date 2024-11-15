import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_realization.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class ShowRealizationServices {
  String? _message;
  String? get message => _message;

  Future<ShowRealization?> getShowRealization(int index) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/realization/$index');
      print(response.data);
      if (response.statusCode == 200) {
        return ShowRealization.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error: $e");
      return null;
    }
  }
}
