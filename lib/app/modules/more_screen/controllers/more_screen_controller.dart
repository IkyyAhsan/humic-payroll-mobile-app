import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/services/profile_services.dart';

class MoreScreenController extends GetxController {
  UserProfile? userProfileData;
  bool isLoading = true;

  void getUserProfileData() async {
    userProfileData = await UserProfileServices().getUserProfile();
    print(userProfileData);
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getUserProfileData();
    super.onInit();
  }
}
