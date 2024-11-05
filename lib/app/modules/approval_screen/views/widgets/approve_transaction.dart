import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approval_row_card.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicApproveTransactionScreen extends StatelessWidget {
  const HumicApproveTransactionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card for Transaction Income
        HumicApprovalRowCard(
            image: HumicImages.humicIncomeSelectedIcon,
            imageColor: HumiColors.humicSecondaryColor,
            dateColor: HumiColors.humicPrimaryColor,
            label: "Income",
            title: "Conference 1",
            date: "03 Okt 2024",
            amount: "Rp.600.000.000",
            onTap: () => Get.back(),
            onApprove: approveConfirmation,
            onDecline: declineConfirmation),
        verticalSpace(12),

        // Card for Transaction Expenses
        HumicApprovalRowCard(
            image: HumicImages.humicExpensesSelectedIcon,
            imageColor: HumiColors.humicPrimaryColor,
            dateColor: HumiColors.humicPrimaryColor,
            label: "Expense",
            title: "Conference 1",
            date: "03 Okt 2024",
            amount: "Rp.600.000.000",
            onTap: () => Get.back(),
            onApprove: approveConfirmation,
            onDecline: declineConfirmation),
        verticalSpace(12),
      ],
    );
  }
}
