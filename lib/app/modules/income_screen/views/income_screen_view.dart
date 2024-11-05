import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_income_screen/views/add_income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_details.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';
import '../controllers/income_screen_controller.dart';

class IncomeScreenView extends GetView<IncomeScreenController> {
  const IncomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(IncomeScreenController());
    return Obx(() {
      return controller.isLoading.value
          ? const Material(
              child: Center(
                  child: CircularProgressIndicator(
                color: HumiColors.humicPrimaryColor,
              )),
            )
          : Scaffold(
              backgroundColor: HumiColors.humicBackgroundColor,
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
                            horizontalSpace(16),
                            Text(
                              "Income",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicBlackColor)),
                            )
                          ],
                        ),
                        verticalSpace(20),

                        // First History
                        Obx(() {
                          if (controller.userIncomeData.value.data?.data ==
                              null) {
                            return RefreshIndicator(
                              onRefresh: () async =>
                                  controller.getUserIncomeData(),
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Center(
                                  child: Column(
                                    children: [
                                      verticalSpace(150),
                                      Lottie.asset(
                                          HumicImages.humicDataNotFound,
                                          height: 230),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return RefreshIndicator(
                              onRefresh: () async =>
                                  controller.getUserIncomeData(),
                              child: ListView.builder(
                                  itemCount: controller.userIncomeData.value
                                          .data?.data?.length ??
                                      0,
                                  shrinkWrap: true,
                                  primary: false,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = controller.userIncomeData.value
                                        .data?.data?[index];
                                    return GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: HumiColors
                                                    .humicTransparencyColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: const EdgeInsets.only(
                                                left: 24, right: 24, top: 21),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                //Income
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      verticalSpace(12),
                                                      Image(
                                                        image: AssetImage(
                                                          data?.transactionType ==
                                                                      'income' ||
                                                                  data?.transactionType ==
                                                                      'Income'
                                                              ? HumicImages
                                                                  .humicIncomeSelectedIcon
                                                              : HumicImages
                                                                  .humicExpensesSelectedIcon,
                                                        ),
                                                        color: (data?.transactionType ==
                                                                    'income' ||
                                                                data?.transactionType ==
                                                                    'Income')
                                                            ? HumiColors
                                                                .humicSecondaryColor
                                                            : (data?.transactionType ==
                                                                        'expense' ||
                                                                    data?.transactionType ==
                                                                        'Expense')
                                                                ? HumiColors
                                                                    .humicPrimaryColor
                                                                : HumiColors
                                                                    .humicThirdSecondaryColor,
                                                        width: 32,
                                                      ),
                                                      Text(
                                                        "${data?.transactionType}",
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                          textStyle: TextStyle(
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: (data?.transactionType ==
                                                                          'income' ||
                                                                      data?.transactionType ==
                                                                          'Income')
                                                                  ? HumiColors
                                                                      .humicSecondaryColor
                                                                  : (data?.transactionType ==
                                                                              'expense' ||
                                                                          data?.transactionType ==
                                                                              'Expense')
                                                                      ? HumiColors
                                                                          .humicPrimaryColor
                                                                      : HumiColors
                                                                          .humicThirdSecondaryColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                horizontalSpace(30),

                                                // Date, Activity Name, Amount
                                                SizedBox(
                                                  width: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        formatDate(
                                                            data?.createdAt),
                                                        style: GoogleFonts.plusJakartaSans(
                                                            textStyle: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: HumiColors
                                                                    .humicPrimaryColor)),
                                                      ),
                                                      Text(
                                                        "${data?.activityName}",
                                                        style: GoogleFonts.plusJakartaSans(
                                                            textStyle: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: HumiColors
                                                                    .humicBlackColor)),
                                                      ),
                                                      Text(
                                                        formatRupiah(
                                                            data?.amount ?? 0),
                                                        style: GoogleFonts.plusJakartaSans(
                                                            textStyle: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: HumiColors
                                                                    .humicTransparencyColor)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                horizontalSpace(30),

                                                // Status Transaksi
                                                Container(
                                                  width: 71,
                                                  height: 23.67,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.16),
                                                    color: (data?.status ==
                                                                'approve' ||
                                                            data?.status ==
                                                                'Approve')
                                                        ? HumiColors
                                                            .humicSecondaryColor
                                                            .withOpacity(0.12)
                                                        : (data?.status ==
                                                                    'denied' ||
                                                                data?.status ==
                                                                    'Denied')
                                                            ? HumiColors
                                                                .humicPrimaryColor
                                                                .withOpacity(
                                                                    0.12)
                                                            : HumiColors
                                                                .humicThirdSecondaryColor
                                                                .withOpacity(
                                                                    0.12),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    data?.status ?? "",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: (data?.status ==
                                                                      'approve' ||
                                                                  data?.status ==
                                                                      'Approve')
                                                              ? HumiColors
                                                                  .humicSecondaryColor
                                                              : (data?.status ==
                                                                          'denied' ||
                                                                      data?.status ==
                                                                          'Denied')
                                                                  ? HumiColors
                                                                      .humicPrimaryColor
                                                                  : HumiColors
                                                                      .humicThirdSecondaryColor),
                                                    ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          verticalSpace(12),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }
                        }),
                        verticalSpace(12),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: SizedBox(
                width: 138,
                height: 51,
                child: FloatingActionButton(
                  onPressed: () => Get.to(() => const AddIncomeScreenView()),
                  backgroundColor: HumiColors.humicPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        const Icon(
                          FluentIcons.add_24_regular,
                          color: HumiColors.humicWhiteColor,
                          size: 20,
                        ),
                        horizontalSpace(6),
                        Text(
                          "Add Income",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicWhiteColor)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
