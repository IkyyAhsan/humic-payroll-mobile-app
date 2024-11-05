import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/controllers/planning_add_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_item_screen.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class PlanningAddNextScreen extends StatelessWidget {
  const PlanningAddNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlanningAddScreenController());
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
                  "Add Plan",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: HumiColors.humicBlackColor)),
                ),
              ],
            ),
            verticalSpace(20),

            // Nama Kegiatan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kegiatan",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
                Text(
                  "Conference ICYCYTA",
                  // controller.namePlan.text,
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(40),

            // Start Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start Date",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
                Text(
                  "15 Oktober 2024",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "End Date",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
                Text(
                  "21 November 2024",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(40),
            Text(
              "Items",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
            ),
            verticalSpace(10),

            //Planning Table
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                  color: HumiColors.humicWhiteColor,
                  border: Border.all(color: HumiColors.humicWhiteColor),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 24,
                        spreadRadius: 6,
                        offset: const Offset(0, 4),
                        color: HumiColors.humicBlackColor.withOpacity(0.05)),
                  ]),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(HumicImages.humicNoItemFoundIcon),
                    ),
                    verticalSpace(8),
                    Text(
                      "No Item Found",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: HumiColors.humicTransparencyColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HumiColors.humicCancelColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Text(
                      'Cancel',
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
                  width: 160,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.offAll(() => const PlanningAddItemScreen()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HumiColors.humicPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.add_12_regular,
                          color: HumiColors.humicWhiteColor,
                          size: 20,
                        ),
                        horizontalSpace(5),
                        Text(
                          'Add Item',
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicWhiteColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
