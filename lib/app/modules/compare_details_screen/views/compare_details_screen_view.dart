import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/views/widgets/compare_planning.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/views/widgets/compare_realization.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/compare_details_screen_controller.dart';

class CompareDetailsScreenView extends GetView<CompareDetailsScreenController> {
  const CompareDetailsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CompareDetailsScreenController());
    return GetBuilder<CompareDetailsScreenController>(
        init: CompareDetailsScreenController(),
        builder: (context) {
          return controller.isLoading
              ? const Material(
                  child: Center(
                      child: CircularProgressIndicator(
                  color: HumiColors.humicPrimaryColor,
                )))
              : Scaffold(
                  backgroundColor: HumiColors.humicBackgroundColor,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        FluentIcons.ios_arrow_ltr_24_regular,
                                        color: HumiColors.humicBlackColor,
                                      ),
                                    ),
                                    horizontalSpace(16),
                                    Text(
                                      "Compare",
                                      style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  HumiColors.humicBlackColor)),
                                    ),
                                  ],
                                ),
                                // Toggle Buttons for Planning and Transaction
                                Obx(
                                  () => Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: controller.togglePlanning,
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          backgroundColor:
                                              controller.isPlanning.value
                                                  ? HumiColors.humicPrimaryColor
                                                  : HumiColors.humicWhiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: Text(
                                          "Planning",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: controller.isPlanning.value
                                                  ? HumiColors.humicWhiteColor
                                                  : HumiColors
                                                      .humicTransparencyColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      horizontalSpace(5),
                                      ElevatedButton(
                                        onPressed: controller.toggleRealization,
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          backgroundColor:
                                              !controller.isPlanning.value
                                                  ? HumiColors.humicPrimaryColor
                                                  : HumiColors.humicWhiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: Text(
                                          "Realization",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: !controller
                                                      .isPlanning.value
                                                  ? HumiColors.humicWhiteColor
                                                  : HumiColors
                                                      .humicTransparencyColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(48),
                            Obx(
                              () => controller.isPlanning.value
                                  ? HumicPlanningCompareScreen(
                                      planning:
                                          controller.compare?.data?.planning,
                                    )
                                  : HumicRealizationCompareScreen(
                                      planning:
                                          controller.compare?.data?.realization,
                                    ),
                            ),
                            verticalSpace(12)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
