import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class ShowApprovalServices {
  String? _message;
  String? get message => _message;

  Future<Approve?> showApproveData(int index) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning/update-status/$index');
      print(response.data);
      if (response.statusCode == 200) {
        return Approve.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error : $e");
      return null;
    }
  }
}
