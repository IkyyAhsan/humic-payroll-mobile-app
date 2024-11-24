import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class humicHomeApproval extends StatelessWidget {
  const humicHomeApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Approve",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor),
              ),
            ),

            // Toggle Buttons for Planning and Transaction
            Obx(
              () => Row(
                children: [
                  ElevatedButton(
                    onPressed: controller.approveToggleRealization,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      backgroundColor: controller.isApproveRealization.value
                          ? HumiColors.humicPrimaryColor
                          : HumiColors.humicWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Planning",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: controller.isApproveRealization.value
                              ? HumiColors.humicWhiteColor
                              : HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(5),
                  ElevatedButton(
                    onPressed: controller.approveToggleTransaction,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: !controller.isApproveRealization.value
                            ? HumiColors.humicPrimaryColor
                            : HumiColors.humicWhiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Transaction",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: !controller.isApproveRealization.value
                              ? HumiColors.humicWhiteColor
                              : HumiColors.humicTransparencyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(24),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.isApproveRealization.value)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller
                            .dashboardData.value.data?.approval?.planning
                            ?.map((planning) {
                          return Container(
                            width: 220,
                            height: 150,
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 30),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFF3F3F3),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: HumiColors.humicCancelColor
                                            .withOpacity(0.14),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Planning",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors
                                                  .humicCancelTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(5),
                                    Container(
                                      width: 60,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: HumiColors.humicBlackColor
                                            .withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${planning.itemCount ?? 0} Items",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF636363),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpace(3),
                                Text(
                                  planning.title ?? "Untitled",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicBlackColor,
                                    ),
                                  ),
                                ),
                                verticalSpace(5),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Start:",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF636363),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          planning.startDate != null
                                              ? formatDate(planning.startDate)
                                              : "-",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    horizontalSpace(12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "End:",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF636363),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          planning.endDate != null
                                              ? formatDate(planning.endDate)
                                              : "-",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                verticalSpace(15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 85,
                                      height: 24,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          backgroundColor:
                                              HumiColors.humicCancelColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Denied",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors
                                                    .humicCancelTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 85,
                                      height: 24,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          backgroundColor:
                                              HumiColors.humicPrimaryColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Approve",
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    HumiColors.humicWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
                )
              else
                const Center(
                  child: Text("No Data Available"),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
