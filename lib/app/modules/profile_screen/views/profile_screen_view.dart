import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/widgets/primary_header_container.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileScreenController());
    final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
    return Scaffold(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(
                                    FluentIcons.ios_arrow_ltr_24_regular,
                                    color: HumiColors.humicWhiteColor,
                                  )),
                              horizontalSpace(16),
                              Text(
                                "Profile",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicWhiteColor)),
                              )
                            ],
                          ),
                          verticalSpace(40),
                          Center(
                            child: CircleAvatar(
                              radius: 100,
                              backgroundImage: const AssetImage(
                                  HumicImages.humicProfileImage),
                              backgroundColor: HumiColors.humicWhiteColor,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: HumiColors.humicWhiteColor,
                                      width: 6,
                                    )),
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Staff Operational",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: HumiColors
                                              .humicTransparencyColor)),
                                ),
                                verticalSpace(5),
                                Text(
                                  "Muhammad Rakha, S.T., M.Kom.",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: HumiColors.humicBlackColor)),
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
                            key: profileFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Password",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: HumiColors.humicBlackColor)),
                                ),
                                verticalSpace(12),
                                Obx(
                                  () => TextFormField(
                                    controller:
                                        profileController.oldPasswordController,
                                    obscureText:
                                        profileController.hideOldPassword.value,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            FluentIcons.lock_closed_24_regular),
                                        hintText: "Old Password",
                                        hintStyle: GoogleFonts.plusJakartaSans(
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
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: HumiColors
                                                    .humicBlackColor)),
                                        suffixIcon: IconButton(
                                            onPressed: () => profileController
                                                    .hideOldPassword.value =
                                                !profileController
                                                    .hideOldPassword.value,
                                            icon: Icon(profileController
                                                    .hideOldPassword.value
                                                ? FluentIcons.eye_off_24_regular
                                                : FluentIcons.eye_24_regular))),
                                  ),
                                ),
                                verticalSpace(12),
                                Obx(
                                  () => TextFormField(
                                    controller:
                                        profileController.newPasswordController,
                                    obscureText:
                                        profileController.hideNewPassword.value,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            FluentIcons.lock_closed_24_regular),
                                        hintText: "New Password",
                                        hintStyle: GoogleFonts.plusJakartaSans(
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
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: HumiColors
                                                    .humicBlackColor)),
                                        suffixIcon: IconButton(
                                            onPressed: () => profileController
                                                    .hideNewPassword.value =
                                                !profileController
                                                    .hideNewPassword.value,
                                            icon: Icon(profileController
                                                    .hideNewPassword.value
                                                ? FluentIcons.eye_off_24_regular
                                                : FluentIcons.eye_24_regular))),
                                  ),
                                ),
                                verticalSpace(12),
                                Obx(
                                  () => TextFormField(
                                    controller: profileController
                                        .confirmPasswordController,
                                    obscureText: profileController
                                        .hideConfirmPassword.value,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            FluentIcons.lock_closed_24_regular),
                                        hintText: HumicTexts
                                            .humicConfirmPasswordTitle,
                                        hintStyle: GoogleFonts.plusJakartaSans(
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
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: HumiColors
                                                    .humicBlackColor)),
                                        suffixIcon: IconButton(
                                            onPressed: () => profileController
                                                    .hideConfirmPassword.value =
                                                !profileController
                                                    .hideConfirmPassword.value,
                                            icon: Icon(profileController
                                                    .hideConfirmPassword.value
                                                ? FluentIcons.eye_off_24_regular
                                                : FluentIcons.eye_24_regular))),
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
                          verticalSpace(32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 46,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            HumiColors.humicPrimaryColor),
                                    onPressed: () {
                                      if (profileFormKey.currentState!
                                          .validate()) {
                                        showPasswordChangeDialog();
                                      }
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicWhiteColor)),
                                    )),
                              )
                            ],
                          )
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
  }
}

void showPasswordChangeDialog() {
  Get.defaultDialog(
    title: '',
    content: Container(
      color: HumiColors.humicWhiteColor,
      padding: EdgeInsets.only(bottom: 38),
      width: 312,
      height: 381,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Your password has been changed',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(50),
          const SizedBox(height: 20),
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
