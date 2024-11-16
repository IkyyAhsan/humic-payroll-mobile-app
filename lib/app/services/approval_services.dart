import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class ApprovalServices {
  String? _message;
  String? get message => _message;

  Future<Approve?> getApproveData() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning-approve');
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
