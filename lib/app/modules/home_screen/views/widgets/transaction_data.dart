import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';

class HumicTransactionData extends StatefulWidget {
  const HumicTransactionData({super.key});

  @override
  _HumicTransactionDataState createState() => _HumicTransactionDataState();
}

class _HumicTransactionDataState extends State<HumicTransactionData> {
  final controller = Get.find<HomeScreenController>();
  int currentPage = 0;
  final int itemsPerPage = 4;

  @override
  Widget build(BuildContext context) {
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
        int startIndex = currentPage * itemsPerPage;
        int endIndex = startIndex + itemsPerPage;
        var paginatedTransactions = controller.filteredTransactions.sublist(
          startIndex,
          endIndex > controller.filteredTransactions.length
              ? controller.filteredTransactions.length
              : endIndex,
        );

        return Column(
          children: [
            ListView.builder(
              itemCount: paginatedTransactions.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                var data = paginatedTransactions[index];
                return GestureDetector(
                  onTap: () => Get.to(() => HumicTransactionDetails(
                        transactionId: '${data.id}',
                        eventName: '${data.activityName}',
                        date: formatDate(data.createdAt),
                        type: formatRupiah(data.amount!),
                        tax: '${data.taxAmount}',
                        transactionTypeName: data.transactionType == 'income' ||
                                data.transactionType == "Income"
                            ? "Pemasukan"
                            : "Pengeluaran",
                      )),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Income or Expenses
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      data.transactionType == 'income' ||
                                              data.transactionType == 'Income'
                                          ? HumicImages.humicIncomeSelectedIcon
                                          : HumicImages
                                              .humicExpensesSelectedIcon,
                                    ),
                                    color: (data.transactionType == 'income' ||
                                            data.transactionType == 'Income')
                                        ? HumiColors.humicSecondaryColor
                                        : (data.transactionType == 'expense' ||
                                                data.transactionType ==
                                                    'Expense')
                                            ? HumiColors.humicPrimaryColor
                                            : HumiColors
                                                .humicThirdSecondaryColor,
                                    width: 32,
                                  ),
                                  Text(
                                    "${data.transactionType}",
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w600,
                                        color: data.transactionType
                                                    ?.toLowerCase() ==
                                                'income'
                                            ? HumiColors.humicSecondaryColor
                                            : HumiColors.humicPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpace(20),

                            // Date, Activity name, Amount
                            SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    formatDate(data.createdAt),
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${data.activityName}",
                                    maxLines: 2,
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicBlackColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatRupiah(data.amount ?? 0),
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            horizontalSpace(18),

                            // Transaction Status
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 71,
                                  height: 23.67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.16),
                                    color: data.status == 'approve'
                                        ? HumiColors.humicSecondaryColor
                                            .withOpacity(0.12)
                                        : HumiColors.humicPrimaryColor
                                            .withOpacity(0.12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${data.status}",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: data.status == 'approve'
                                              ? HumiColors.humicSecondaryColor
                                              : HumiColors.humicPrimaryColor,
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
                      verticalSpace(12),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  icon: const Icon(
                    FluentIcons.chevron_left_24_regular,
                    color: Colors.black, // Warna ikon chevron menjadi hitam
                  ),
                ),
                for (int i = 0;
                    i <
                        (controller.filteredTransactions.length / itemsPerPage)
                            .ceil();
                    i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = i;
                        });
                      },
                      child: currentPage == i
                          ? CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Text(
                                '${i + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Text(
                              '${i + 1}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                IconButton(
                  onPressed: (currentPage + 1) * itemsPerPage <
                          controller.filteredTransactions.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  icon: const Icon(
                    FluentIcons.chevron_right_24_regular,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    });
  }
}
