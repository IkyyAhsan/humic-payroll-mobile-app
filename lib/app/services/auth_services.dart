import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/login_input.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/register_input.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/update_password_input.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/update_profile_input.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class AuthServices {
  String _message = "";
  String get message => _message;

  // Register
  Future<bool> registers(RegisterInput registerInput) async {
    try {
      RegisterInput request = RegisterInput(
          name: registerInput.name,
          email: registerInput.email,
          password: registerInput.password,
          passwordConfirmation: registerInput.passwordConfirmation);
      Map<String, dynamic> data = {
        "name": request.name,
        "email": request.email,
        "password": request.password,
        "password_confirmation": request.passwordConfirmation,
      };
      final response = await dio.post("/register", data: data);
      print(response.data);

      if (response.statusCode == 201) {
        _message = response.data['message'];
        GetStorage().write("token", response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Login
  Future<bool> login(LoginInput loginInput) async {
    try {
      LoginInput request =
          LoginInput(email: loginInput.email, password: loginInput.password);
      Map<String, dynamic> data = {
        "email": request.email,
        "password": request.password
      };
      final response = await dio.post("/login", data: data);
      print(response.data);

      if (response.statusCode == 200) {
        _message = response.data['message'];
        GetStorage().write('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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
      throw Exception(e);
    }
  }

  // Update Profile
  Future<bool> updateProfile(UpdateProfileInput updateProfile) async {
    try {
      Map<String, dynamic> data = {
        "name": updateProfile.name,
        "image": await MultipartFile.fromFile(updateProfile.image!.path,
            filename: updateProfile.name)
      };

      var formData = FormData.fromMap(data);
      final response = await dio.post("/update-profile", data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        _message = response.data['message'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error updating password: $e");
      throw Exception(e);
    }
  }
}
