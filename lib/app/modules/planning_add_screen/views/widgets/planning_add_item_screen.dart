import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/controllers/planning_add_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class PlanningAddItemScreen extends StatelessWidget {
  const PlanningAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlanningAddScreenController());
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
                    "Add Item",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor)),
                  ),
                ],
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
