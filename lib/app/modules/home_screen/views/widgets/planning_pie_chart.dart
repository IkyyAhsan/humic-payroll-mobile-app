import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicPlanningPieChart extends StatelessWidget {
  const HumicPlanningPieChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Planning",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor),
              ),
            ),

            // Toggle Buttons for Planning and Transaction
            Obx(
              () => Row(
                children: [
                  ElevatedButton(
                    onPressed: controller.planningToggleRealization,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      backgroundColor: controller.isPlanningRealization.value
                          ? HumiColors.humicPrimaryColor
                          : HumiColors.humicWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Planning",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: controller.isPlanningRealization.value
                              ? HumiColors.humicWhiteColor
                              : HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(5),
                  ElevatedButton(
                    onPressed: controller.planningToggleTransaction,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: !controller.isPlanningRealization.value
                            ? HumiColors.humicPrimaryColor
                            : HumiColors.humicWhiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Transaction",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: !controller.isPlanningRealization.value
                              ? HumiColors.humicWhiteColor
                              : HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
