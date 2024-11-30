import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/controllers/approval_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approval_row_card.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/views/planning_detail_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';
import 'package:lottie/lottie.dart';

class HumicApprovePlanningScreen extends StatelessWidget {
  final Approve approve;

  const HumicApprovePlanningScreen({
    super.key,
    required this.approve,
  });

  @override
  Widget build(BuildContext context) {
    final approvalController = Get.put(ApprovalScreenController());
    var approvalData = approvalController.approvalData.data?.data;
    if (approvalData == null || approvalData.isEmpty) {
      return Center(
        child: Column(
          children: [
            verticalSpace(200),
            Lottie.asset(
              HumicImages.humicDataNotFound,
              height: 170,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: approvalController.approvalData.data?.data?.length,
        itemBuilder: (_, index) {
          var data = approvalController.approvalData.data?.data?[index];
          return Column(
            children: [
              HumicApprovalRowCard(
                image: HumicImages.humicSelectedPlanningNavbar,
                imageColor: HumiColors.humicThirdSecondaryColor,
                dateColor: HumiColors.humicPrimaryColor,
                label: "${data?.status}",
                title: "${data?.title}",
                date:
                    "${tableDateFormat(data?.createdAt)} - ${tableDateFormat(data?.endDate)}",
                amount: formatRupiah(
                    int.tryParse(data?.itemSumNettoAmount ?? '0') ?? 0),
                onTap: () => Get.to(
                  () => const PlanningDetailScreenView(),
                  arguments: {
                    "id": data?.id,
                  },
                ),
                onApprove: () {
                  // print("id : ${data?.id}");
                  approveConfirmation(id: data?.id ?? 0);
                },
                onDecline: () {
                  declineConfirmation(id: data?.id ?? 0);
                },
              ),
              verticalSpace(12),
            ],
          );
        });
  }
}
