import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_edit_screen/views/planning_edit_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/planning_details_screen_controller.dart';

class PlanningDetailsScreenView
    extends GetView<PlanningDetailsScreenController> {
  const PlanningDetailsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        FluentIcons.ios_arrow_ltr_24_regular,
                        color: HumiColors.humicBlackColor,
                      )),
                  horizontalSpace(16),
                  Text(
                    "Planning Details",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor)),
                  ),
                ],
              ),
              verticalSpace(48),
              Column(
                children: [
                  // Kegiatan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kegiatan",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor),
                        ),
                      ),
                      Text(
                        "Planning for Conference A",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),

                  // Deadline
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deadline",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor),
                        ),
                      ),
                      Text(
                        "03 Okt 2024",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),

                  // Target
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Target",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicTransparencyColor),
                        ),
                      ),
                      Text(
                        "Rp240.000.000 / Rp300.000.000",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicBlackColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(36),
                  Container(
                    width: double.infinity,
                    height: 420,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: HumiColors.humicWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.11),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Planning For Conference A",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor)),
                        ),
                        verticalSpace(20),
                        Text(
                          "Ini adalah deskripsi dari rencana yang ingin dilakukan kedepannya jadi gini.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicTransparencyColor,
                            ),
                          ),
                        ),
                        verticalSpace(20),
                        const Image(
                          image: AssetImage(HumicImages.humicLogo),
                          height: 130,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const PlanningEditScreenView()),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HumiColors.humicCancelColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FluentIcons.edit_24_regular,
                                color: HumiColors.humicPrimaryColor,
                              ),
                              horizontalSpace(4),
                              Text(
                                'Edit',
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: HumiColors.humicPrimaryColor)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(6),
                      SizedBox(
                        width: 150,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.offAll(() => const BottomNavigationBarView()),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HumiColors.humicPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Text(
                            'Close',
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
            ],
          ),
        ),
      ),
    );
  }
}
