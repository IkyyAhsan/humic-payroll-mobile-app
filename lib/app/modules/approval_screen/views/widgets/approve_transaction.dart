import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/controllers/approval_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approval_row_card.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';

class HumicApproveTransactionScreen extends StatelessWidget {
  final Approve approve;
  const HumicApproveTransactionScreen({
    super.key,
    required this.approve,
  });

  @override
  Widget build(BuildContext context) {
    final approvalController = Get.put(ApprovalScreenController());
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: approvalController.approvalData.data?.data?.length,
      itemBuilder: (_, index) {
        var data = approvalController.approvalData.data?.data?[index];

        return Column(
          children: [
            // Card for Transaction Income
            HumicApprovalRowCard(
              image: HumicImages.humicIncomeSelectedIcon,
              imageColor: HumiColors.humicSecondaryColor,
              dateColor: HumiColors.humicPrimaryColor,
              label: "${data?.status}",
              title: "${data?.title}",
              date:
                  "${tableDateFormat(data?.createdAt)} - ${tableDateFormat(data?.endDate)}",
              amount: "${data?.itemSumNettoAmount ?? 0}",
              onTap: () {},
              onApprove: approveConfirmation,
              onDecline: declineConfirmation,
            ),
            verticalSpace(12),
          ],
        );
      },
    );
  }
}
