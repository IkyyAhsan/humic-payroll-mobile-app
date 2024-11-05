import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/update_password_input.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/update_profile_input.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/auth_services.dart';
import 'package:humic_payroll_mobile_app/app/services/profile_services.dart';
import 'package:humic_payroll_mobile_app/app/services/update_password_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final hideOldPassword = true.obs;
  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;
  bool isUpdatePasswordSuccessfull = false;
  bool isUpdateProfileSuccessfull = false;

  UpdatedPasswordServices updatedPasswordServices = UpdatedPasswordServices();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  UserProfile? userProfileData;
  bool isLoading = true;
  XFile? image;
  Rxn<XFile> selectedImage = Rxn<XFile>();
  void updateProf() async {
    isLoading = true;
    update();

    if (nameController.text.isEmpty && selectedImage.value == null) {
      var passwordInput = UpdatePasswordInput(
        currentPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmPasswordController.text,
      );
      isUpdatePasswordSuccessfull =
          await UpdatedPasswordServices().updatePassword(passwordInput);

      if (isUpdatePasswordSuccessfull) {
        print("Successfully");
        Get.snackbar(
          "Update Password Successfully",
          "Youve success to change ur password",
          backgroundColor: HumiColors.humicSecondaryColor,
          colorText: HumiColors.humicWhiteColor,
        );
        await Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
      } else {
        Get.snackbar(
          "Update Password Failed",
          "Youve trouble with your password",
          backgroundColor: HumiColors.humicPrimaryColor,
          colorText: HumiColors.humicWhiteColor,
        );
      }
    } else {
      if (selectedImage.value != null) {
        var profileinput = UpdateProfileInput(
          name: nameController.text.isNotEmpty
              ? nameController.text
              : userProfileData?.name ?? '',
          image: File(selectedImage.value!.path),
        );
        isUpdateProfileSuccessfull =
            await AuthServices().updateProfile(profileinput);

        // Update userProfileData di HomeScreenController
        if (isUpdateProfileSuccessfull) {
          Get.find<HomeScreenController>().getUserProfileData();
          Get.snackbar(
            "Successfully",
            "Your Success to change your profile picture and your name",
            backgroundColor: HumiColors.humicSecondaryColor,
            colorText: HumiColors.humicWhiteColor,
          );
          await Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
        } else {
          Get.snackbar(
            "Failed",
            "Your fail to change your profile picture and your name",
            backgroundColor: HumiColors.humicPrimaryColor,
            colorText: HumiColors.humicWhiteColor,
          );
        }
      }
    }
    isLoading = false;
    update();
  }

  void getImage() async {
    XFile? getImageFromGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (getImageFromGallery != null) {
      selectedImage.value = getImageFromGallery;
      userProfileData?.image = null;
      update();
    }
  }

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
