import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/widgets/export_items.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/widgets/export_transaction.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/export_screen_controller.dart';

class ExportScreenView extends GetView<ExportScreenController> {
  const ExportScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExportScreenController());
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          "Export",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor)),
                        ),
                      ],
                    ),

                    // Toggle Buttons for Planning and Transaction
                    Obx(
                      () => Row(
                        children: [
                          ElevatedButton(
                            onPressed: controller.toggleItems,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              backgroundColor: controller.isItems.value
                                  ? HumiColors.humicPrimaryColor
                                  : HumiColors.humicWhiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              "Items",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isItems.value
                                      ? HumiColors.humicWhiteColor
                                      : HumiColors.humicTransparencyColor,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(5),
                          ElevatedButton(
                            onPressed: controller.toggleTransaction,
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                backgroundColor: !controller.isItems.value
                                    ? HumiColors.humicPrimaryColor
                                    : HumiColors.humicWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: Text(
                              "Transactions",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: !controller.isItems.value
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
                verticalSpace(20),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.isItems.value
                              ? "Export Items Data"
                              : "Export Transactions Data",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HumiColors.humicTransparencyColor,
                            ),
                          ),
                        ),
                        verticalSpace(12),

                        // Tampilan "Items" atau "Transactions"
                        if (controller.isItems.value)
                          const HumicExportItemScreen()
                        else
                          const HumicExportTransactionScreen(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
