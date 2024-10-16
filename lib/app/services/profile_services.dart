import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';

import '../shared/constant.dart';

class UserProfileServices {
  String? _message;
  String? get message => _message;

  Future<UserProfile?> getUserProfile() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      // Permintaan GET ke API user profile
      final response = await dio.get('/user');

      if (response.statusCode == 200) {
        // Jika berhasil, parsing JSON menjadi UserProfile
        return UserProfile.fromJson(response.data);
      } else {
        _message = "Failed to load profile: ${response.statusCode}";
        return null;
      }
    } catch (e) {
      _message = "Error: $e";
      return null;
    }
  }
}
