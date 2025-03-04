import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/controllers/approval_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approval_row_card.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';
import 'package:lottie/lottie.dart';

import '../../../../routes/app_pages.dart';

class HumicApproveTransactionScreen extends StatelessWidget {
  final UserIncome userIncome;
  const HumicApproveTransactionScreen({
    super.key,
    required this.userIncome,
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
        itemCount: approvalController.incomeData.data?.data?.length,
        itemBuilder: (_, index) {
          var data = approvalController.incomeData.data?.data?[index];
          return Column(
            children: [
              HumicApprovalRowCard(
                image: HumicImages.humicSelectedPlanningNavbar,
                imageColor: data?.transactionType == 'expense'
                    ? HumiColors.humicPrimaryColor
                    : HumiColors.humicSecondaryColor,
                dateColor: HumiColors.humicPrimaryColor,
                label: "${data?.transactionType}",
                title: "${data?.activityName}",
                date: tableDateFormat(data?.createdAt),
                amount: formatRupiah(data?.amount ?? 0),
                onTap: () => Get.to(() => HumicTransactionDetails(
                      transactionId: '${data?.id}',
                      eventName: '${data?.activityName}',
                      date: formatDate(data?.createdAt),
                      type: formatRupiah(data?.amount ?? 0),
                      tax: '${data?.taxAmount}',
                      transactionTypeName: data?.transactionType == 'income' ||
                              data?.transactionType == "Income"
                          ? "Pemasukan"
                          : "Pengeluaran",
                      status: '${data?.status}',
                      documentEvidence: '',
                    )),
                onApprove: () {
                  // print("id : ${data?.id}");
                  approveConfirmation(
                      id: data?.id ?? 0,
                      onConfirm: () async {
                        var controller = Get.put(ApprovalScreenController());
                        controller.updateTransaction(data?.id ?? 0);
                        Get.back();
                        Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
                        final navbarController =
                            Get.put(BottomNavigationBarController());
                        navbarController.selectedIndex(3);
                        Get.snackbar("Approval Successful",
                            "The Transaction has been successfully approved.",
                            colorText: HumiColors.humicWhiteColor,
                            backgroundColor: HumiColors.humicSecondaryColor,
                            snackPosition: SnackPosition.TOP);
                      });
                },
                onDecline: () {
                  declineConfirmation(
                      id: data?.id ?? 0,
                      onConfirm: () async {
                        var controller = Get.put(ApprovalScreenController());
                        controller.deleteTransaction(data?.id ?? 0);
                        controller.updateTransaction(data?.id ?? 0);
                        Get.back();
                        Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
                        final navbarController =
                            Get.put(BottomNavigationBarController());
                        navbarController.selectedIndex(3);
                        Get.snackbar(
                          "Transaction Declined",
                          "The transaction has been successfully declined.",
                          colorText: HumiColors.humicWhiteColor,
                          backgroundColor: HumiColors.humicSecondaryColor,
                          snackPosition: SnackPosition.TOP,
                        );
                      });
                },
              ),
              verticalSpace(12),
            ],
          );
        });
  }
}
