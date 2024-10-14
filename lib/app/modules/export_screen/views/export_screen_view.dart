import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/export_screen_controller.dart';

class ExportScreenView extends GetView<ExportScreenController> {
  const ExportScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
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
                      "Export",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    )
                  ],
                ),
                verticalSpace(20),

                // First Fitures
                GestureDetector(
                  onTap: () => Get.to(() => const ExportScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.calendar_empty_24_regular,
                          weight: 24,
                          size: 32,
                        ),
                        horizontalSpace(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Date Range",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          HumiColors.humicTransparencyColor)),
                            ),
                            Text(
                              "03 Okt - 03 Nov 2024",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicBlackColor)),
                            ),
                          ],
                        ),
                        horizontalSpace(60),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(FluentIcons.arrow_right_24_regular),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Second Fitures
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HumiColors.humicTransparencyColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FluentIcons.document_24_filled,
                        weight: 32,
                        size: 32,
                      ),
                      horizontalSpace(18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select File Type",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicTransparencyColor)),
                          ),
                          Text(
                            "Excel(.csvx)",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicBlackColor)),
                          ),
                        ],
                      ),
                      horizontalSpace(106),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(FluentIcons.arrow_right_24_regular),
                      ),
                    ],
                  ),
                ),
                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
