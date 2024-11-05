import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approval_row_card.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/controllers/planning_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicApprovePlanningScreen extends StatelessWidget {
  const HumicApprovePlanningScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final planningController = Get.put(PlanningScreenController());
    return Column(
      children: [
        // Card for Approve Planning Item
        HumicApprovalRowCard(
          image: HumicImages.humicSelectedPlanningNavbar,
          imageColor: HumiColors.humicThirdSecondaryColor,
          dateColor: HumiColors.humicPrimaryColor,
          label: "Planning",
          title: "Conference ICYCYTA",
          date: "03/10/2024 - 21/11/2024",
          amount: "Rp.600.000.000",
          onTap: () {},
          //onTap: () => Get.to(() => const PlanningDetailsScreenView()),
          onApprove: approveConfirmation,
          onDecline: declineConfirmation,
        ),
        verticalSpace(12),
      ],
    );
  }
}
