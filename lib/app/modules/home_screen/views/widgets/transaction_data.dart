import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/transaction_details_screen/views/transaction_details_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';

class HumicTransactionData extends StatelessWidget {
  const HumicTransactionData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Obx(() {
      if (controller.filteredTransactions.isEmpty) {
        return Center(
          child: Column(
            children: [
              verticalSpace(100),
              Lottie.asset(HumicImages.humicDataNotFound, height: 170),
            ],
          ),
        );
      } else {
        return ListView.builder(
          itemCount: controller.filteredTransactions.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            var data = controller.filteredTransactions[index];
            return GestureDetector(
              onTap: () => Get.to(() => const TransactionDetailsScreenView()),
              child: Column(
                children: [
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
                        const EdgeInsets.only(left: 24, right: 24, top: 21),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Income or Expenses
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              verticalSpace(12),
                              Image(
                                image: AssetImage(
                                  data.transactionType?.toLowerCase() ==
                                          'income'
                                      ? HumicImages.humicIncomeSelectedIcon
                                      : HumicImages.humicExpensesSelectedIcon,
                                ),
                                color: data.transactionType?.toLowerCase() ==
                                        'income'
                                    ? HumiColors.humicSecondaryColor
                                    : HumiColors.humicPrimaryColor,
                                width: 32,
                              ),
                              Text(
                                "${data.transactionType}",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        data.transactionType?.toLowerCase() ==
                                                'income'
                                            ? HumiColors.humicSecondaryColor
                                            : HumiColors.humicPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(30),

                        // Date, Activity name, Amount
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatDate(data.createdAt),
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicPrimaryColor)),
                              ),
                              Text(
                                "${data.activityName}",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicBlackColor)),
                              ),
                              Text(
                                formatRupiah(data.amount ?? 0),
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor)),
                              )
                            ],
                          ),
                        ),
                        horizontalSpace(30),

                        // Status Transaksi
                        Expanded(
                          child: Container(
                            width: 71,
                            height: 23.67,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.16),
                                color: data.status == 'approve'
                                    ? HumiColors.humicSecondaryColor
                                        .withOpacity(0.12)
                                    : HumiColors.humicPrimaryColor
                                        .withOpacity(0.12)),
                            child: Center(
                              child: Text(
                                "${data.status}",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: data.status == 'approve'
                                          ? HumiColors.humicSecondaryColor
                                          : HumiColors.humicPrimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(12),
                ],
              ),
            );
          },
        );
      }
    });
  }
}
