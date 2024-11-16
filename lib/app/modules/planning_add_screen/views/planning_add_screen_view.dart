import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/planning_add_screen_controller.dart';

class PlanningAddScreenView extends GetView<PlanningAddScreenController> {
  const PlanningAddScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PlanningAddScreenController());
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
              verticalSpace(32),
              const Divider(
                color: HumiColors.humicBackgroundColor,
                height: 2,
              ),
              verticalSpace(20),

              // Nama Kegiatan
              Text(
                "Nama Kegiatan",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  controller: controller.namePlan,
                  decoration: InputDecoration(
                      hintText: "Masukkan nama kegiatan..",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HumiColors.humicTransparencyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              verticalSpace(14),

              // Start Date
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
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                    readOnly: true,
                    controller: controller.startDate,
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HumiColors.humicTransparencyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: controller.changeStartDate),
              ),
              verticalSpace(14),
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
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                    readOnly: true,
                    controller: controller.endDate,
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: controller.changeEndDate),
              ),
              verticalSpace(55),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
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
                        'Cancel',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(6),
                  SizedBox(
                    width: 150,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: controller.checkPlanningAddItem,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HumiColors.humicPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        'Next',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicWhiteColor,
                          ),
                        ),
                      ),
                    ),
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
