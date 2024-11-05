import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/update_password_input.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class UpdatedPasswordServices {
  String _message = "";
  String get message => _message;

  // Update Password
  Future<bool> updatePassword(UpdatePasswordInput updatePasswordInput) async {
    try {
      Map<String, dynamic> data = {
        "current_password": updatePasswordInput.currentPassword,
        "new_password": updatePasswordInput.newPassword,
        "new_password_confirmation":
            updatePasswordInput.newPasswordConfirmation,
      };

      final response = await dio.post("/update-password", data: data);
      print(response.data);

      if (response.statusCode == 200) {
        _message = response.data['message'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error updating password: $e");
      Get.snackbar("Error", "An error occurred: $e");
      throw Exception(e);
    }
  }
}
