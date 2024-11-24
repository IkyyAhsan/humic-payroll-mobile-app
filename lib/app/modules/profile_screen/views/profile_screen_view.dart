// ignore_for_file: avoid_print

import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/widgets/primary_header_container.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/validators/validation.dart';
import 'package:lottie/lottie.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    LoginScreenController loginController = LoginScreenController();
    Get.put(ProfileScreenController());
    return GetBuilder<ProfileScreenController>(builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(
              child: CircularProgressIndicator(
                color: HumiColors.humicPrimaryColor,
              ),
            ))
          : Scaffold(
              backgroundColor: HumiColors.humicBackgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    HUMICPrimaryHeaderContainer(
                      child: Column(
                        children: [
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () => Get.back(),
                                            icon: const Icon(
                                              FluentIcons
                                                  .ios_arrow_ltr_24_regular,
                                              color: HumiColors.humicWhiteColor,
                                            )),
                                        horizontalSpace(16),
                                        Text(
                                          "Profile",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: HumiColors.humicWhiteColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    verticalSpace(40),
                                    Visibility(
                                      visible:
                                          controller.userProfileData?.image !=
                                              null,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 100,
                                              backgroundImage: NetworkImage(
                                                "https://payroll.humicprototyping.com/storage/app/public/${controller.userProfileData?.image}",
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: HumiColors
                                                      .humicPrimaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    FluentIcons.edit_24_filled,
                                                    color: HumiColors
                                                        .humicWhiteColor,
                                                  ),
                                                  onPressed:
                                                      controller.getImage,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Visibility(
                                      visible:
                                          controller.userProfileData?.image ==
                                              null,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            Obx(
                                              () => CircleAvatar(
                                                radius: 100,
                                                backgroundImage: controller
                                                            .selectedImage
                                                            .value ==
                                                        null
                                                    ? const AssetImage(
                                                        HumicImages
                                                            .humicProfileImage,
                                                      )
                                                    : FileImage(
                                                        File(
                                                          controller
                                                              .selectedImage
                                                              .value!
                                                              .path,
                                                        ),
                                                      ),
                                                backgroundColor:
                                                    HumiColors.humicWhiteColor,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: HumiColors
                                                            .humicWhiteColor,
                                                        width: 6,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: HumiColors
                                                      .humicPrimaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    FluentIcons.edit_24_filled,
                                                    color: HumiColors
                                                        .humicWhiteColor,
                                                  ),
                                                  onPressed:
                                                      controller.getImage,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    verticalSpace(18),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${controller.userProfileData?.name}",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                          verticalSpace(5),
                                          Text(
                                            "${controller.userProfileData?.role}",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: HumiColors
                                                    .humicTransparencyColor,
                                              ),
                                            ),
                                          ),
                                          verticalSpace(24),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: HumiColors.humicDividerColor,
                                      thickness: 2,
                                    ),
                                    verticalSpace(24),
                                    Form(
                                      key: controller.profileFormKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Change Name",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                          verticalSpace(12),
                                          TextFormField(
                                            validator: (value) =>
                                                HumicValidators
                                                    .registerNameValidate(
                                                        value),
                                            controller:
                                                controller.nameController,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  FluentIcons.person_24_filled),
                                              hintText: "Change Name",
                                              hintStyle:
                                                  GoogleFonts.plusJakartaSans(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: HumiColors
                                                      .humicTransparencyColor,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          verticalSpace(24),
                                          const Divider(
                                            color: HumiColors.humicDividerColor,
                                            thickness: 2,
                                          ),
                                          verticalSpace(24),
                                          Text(
                                            "New Password",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                          verticalSpace(12),
                                          Obx(
                                            () => TextFormField(
                                              validator: (value) {
                                                if (controller
                                                        .oldPasswordController !=
                                                    loginController
                                                        .passwordController) {
                                                  Get.snackbar(
                                                    "Something went wrong",
                                                    "The password you entered does not match your current password. Please try again.",
                                                    backgroundColor: HumiColors
                                                        .humicPrimaryColor,
                                                    colorText: HumiColors
                                                        .humicWhiteColor,
                                                  );
                                                }
                                                return null;
                                              },
                                              controller: controller
                                                  .oldPasswordController,
                                              obscureText: controller
                                                  .hideOldPassword.value,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                  FluentIcons
                                                      .lock_closed_24_filled,
                                                ),
                                                hintText: "Old Password",
                                                hintStyle:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: HumiColors
                                                        .humicTransparencyColor,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: HumiColors
                                                        .humicBlackColor,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => controller
                                                          .hideOldPassword
                                                          .value =
                                                      !controller
                                                          .hideOldPassword
                                                          .value,
                                                  icon: Icon(
                                                    controller.hideOldPassword
                                                            .value
                                                        ? FluentIcons
                                                            .eye_off_24_regular
                                                        : FluentIcons
                                                            .eye_24_regular,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          verticalSpace(12),
                                          Obx(
                                            () => TextFormField(
                                              validator: (value) =>
                                                  HumicValidators
                                                      .registerPasswordValidate(
                                                          value),
                                              controller: controller
                                                  .newPasswordController,
                                              obscureText: controller
                                                  .hideNewPassword.value,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                  FluentIcons
                                                      .lock_closed_24_filled,
                                                ),
                                                hintText: "New Password",
                                                hintStyle:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: HumiColors
                                                        .humicTransparencyColor,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: HumiColors
                                                        .humicBlackColor,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => controller
                                                          .hideNewPassword
                                                          .value =
                                                      !controller
                                                          .hideNewPassword
                                                          .value,
                                                  icon: Icon(controller
                                                          .hideNewPassword.value
                                                      ? FluentIcons
                                                          .eye_off_24_regular
                                                      : FluentIcons
                                                          .eye_24_regular),
                                                ),
                                              ),
                                            ),
                                          ),
                                          verticalSpace(12),
                                          Obx(
                                            () => TextFormField(
                                              validator: (value) => HumicValidators
                                                  .registerConfirmPasswordValidate(
                                                      value,
                                                      controller
                                                          .newPasswordController
                                                          .text),
                                              controller: controller
                                                  .confirmPasswordController,
                                              obscureText: controller
                                                  .hideConfirmPassword.value,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    FluentIcons
                                                        .lock_closed_24_filled),
                                                hintText: HumicTexts
                                                    .humicConfirmPasswordTitle,
                                                hintStyle:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: HumiColors
                                                        .humicTransparencyColor,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: HumiColors
                                                          .humicBlackColor),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => controller
                                                          .hideConfirmPassword
                                                          .value =
                                                      !controller
                                                          .hideConfirmPassword
                                                          .value,
                                                  icon: Icon(
                                                    controller.hideConfirmPassword
                                                            .value
                                                        ? FluentIcons
                                                            .eye_off_24_regular
                                                        : FluentIcons
                                                            .eye_24_regular,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(24),
                                    const Divider(
                                      color: HumiColors.humicDividerColor,
                                      thickness: 2,
                                    ),
                                    verticalSpace(20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                HumiColors.humicPrimaryColor,
                                            minimumSize: const Size(150, 46),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.updateProf();
                                          },
                                          child: Text(
                                            'Confirm',
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(40),

                                    // Logout Button
                                    GestureDetector(
                                      onTap: logoutConfirmation,
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: HumiColors.humicPrimaryColor
                                              .withOpacity(0.12),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              FluentIcons.sign_out_24_filled,
                                              weight: 32,
                                              size: 32,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                            horizontalSpace(18),
                                            Text(
                                              "Log out",
                                              style: GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: HumiColors
                                                          .humicPrimaryColor)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    verticalSpace(12),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
    });
  }
}

void changePasswordSuccessfull() {
  print("Decline confirmation dialog should appear");
  Get.defaultDialog(
    title: '',
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: 329,
      height: 409,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: HumiColors.humicWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset(HumicImages.humicSuccessfullChangePassword,
              width: 280, height: 280),
          Text(
            'Your password has been changed',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(50),
          SizedBox(
            width: 150,
            height: 46,
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: HumiColors.humicPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Text(
                'Back',
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicWhiteColor)),
              ),
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

void logoutConfirmation() {
  print("Logout confirmation dialog should appear");
  Get.defaultDialog(
    title: '',
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 329,
      height: 409,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: HumiColors.humicWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 222,
              height: 222,
              child: Lottie.asset(HumicImages.humicLogoutAnimation)),
          verticalSpace(50),
          Text(
            'Apakah anda yakin untuk Log Out?',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(20),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HumiColors.humicCancelColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Back',
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicPrimaryColor)),
                  ),
                ),
              ),
              horizontalSpace(6),
              SizedBox(
                width: 140,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const LoginScreenView()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HumiColors.humicPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicWhiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
