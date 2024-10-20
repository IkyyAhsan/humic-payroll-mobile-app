import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_income_screen/views/add_income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/transaction_details_screen/views/transaction_details_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
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
                          if (controller.incomeTransactions.isEmpty) {
                            return Center(
                              child: Column(
                                children: [
                                  verticalSpace(150),
                                  Lottie.asset(HumicImages.humicDataNotFound,
                                      height: 230),
                                ],
                              ),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: controller.incomeTransactions.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  var data =
                                      controller.incomeTransactions[index];
                                  return GestureDetector(
                                    onTap: () => Get.to(() =>
                                        const TransactionDetailsScreenView()),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              HumiColors.humicTransparencyColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 24, right: 24, top: 24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              verticalSpace(12),
                                              const Image(
                                                image: AssetImage(HumicImages
                                                    .humicIncomeSelectedIcon),
                                                color: HumiColors
                                                    .humicSecondaryColor,
                                                width: 32,
                                              ),
                                              Text(
                                                "${data.transactionType}",
                                                style: GoogleFonts.plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12.5,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicSecondaryColor)),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.createdAt}",
                                                style: GoogleFonts.plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: HumiColors
                                                            .humicPrimaryColor)),
                                              ),
                                              Text(
                                                "${data.activityName}",
                                                style: GoogleFonts.plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: HumiColors
                                                            .humicBlackColor)),
                                              ),
                                              Text(
                                                "${data.amount}",
                                                style: GoogleFonts.plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicTransparencyColor)),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: 71,
                                            height: 23.67,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.16),
                                              color: const Color(0xFF48B121)
                                                  .withOpacity(0.16),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "${data.status}",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xFF48B121))),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
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
