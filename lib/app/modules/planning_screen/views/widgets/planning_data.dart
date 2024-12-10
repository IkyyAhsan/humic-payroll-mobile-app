import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_next_screen.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/views/planning_detail_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/controllers/planning_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/year_format.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class HumicPlanningData extends StatelessWidget {
  const HumicPlanningData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanningScreenController>();
    return Column(
      children: [
        ListView.builder(
          itemCount: controller.pageData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = controller.pageData[index];
            return GestureDetector(
              onTap: () => Get.to(
                () => const PlanningDetailScreenView(),
                arguments: {
                  "id": data.id,
                },
              ),
              child: Container(
                width: double.infinity,
                height: 95,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HumiColors.humicWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                        color: HumiColors.humicBlackColor.withOpacity(0.07),
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 55,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: (data.status == 'approve' ||
                                              data.status == 'Approve')
                                          ? HumiColors.humicSecondaryColor
                                              .withOpacity(0.12)
                                          : (data.status == 'decline' ||
                                                  data.status == 'Decline')
                                              ? HumiColors.humicPrimaryColor
                                                  .withOpacity(0.12)
                                              : HumiColors
                                                  .humicThirdSecondaryColor
                                                  .withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      data.status,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                            color: (data.status == 'approve' ||
                                                    data.status == 'Approve')
                                                ? HumiColors.humicSecondaryColor
                                                : (data.status == 'decline' ||
                                                        data.status ==
                                                            'Decline')
                                                    ? HumiColors
                                                        .humicPrimaryColor
                                                    : HumiColors
                                                        .humicThirdSecondaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpace(4),
                                Container(
                                  width: 45,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: HumiColors.humicBlackColor
                                        .withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data.itemCount} Items',
                                      style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors
                                                  .humicTransparencyColor)),
                                    ),
                                  ),
                                ),
                                horizontalSpace(4),
                                Container(
                                  width: 45,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: HumiColors.humicYearColor
                                        .withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      formatYear(data.createdAt),
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicYearColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              data.title,
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: HumiColors.humicBlackColor)),
                            ),
                            Text(
                              "Total Netto: ${formatRupiah(int.tryParse(data.itemSumNettoAmount ?? '0') ?? 0)}",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _dateBox("Start", data.startDate),
                            horizontalSpace(5),
                            _dateBox("End", data.endDate),
                            if (data.status == "pending") ...[
                              horizontalSpace(12),
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "Sending ID: ${data.id} to next screen");

                                  Get.to(
                                      () => PlanningAddNextScreen(
                                            id: data.id,
                                          ),
                                      arguments: {"id": data.id});
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: HumiColors.humicPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: const Iconify(
                                      Bx.edit,
                                      color: HumiColors.humicWhiteColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // Pagination Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: controller.currentPage.value > 1
                  ? () {
                      controller.decrementPagination();
                    }
                  : null,
              icon: const Icon(
                FluentIcons.chevron_left_24_regular,
                color: HumiColors.humicBlackColor,
              ),
            ),
            for (int i = 1; i <= controller.totalPages.value; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    controller.getPlanningData(
                        index: i); // Pindah ke halaman tertentu
                    controller.currentPage.value = i; // Atur currentPage
                  },
                  child: controller.currentPage.value == i
                      ? CircleAvatar(
                          radius: 12,
                          backgroundColor: HumiColors.humicPrimaryColor,
                          child: Text(
                            '$i',
                            style: const TextStyle(
                              color: HumiColors.humicWhiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          '$i',
                          style: const TextStyle(
                            color: HumiColors.humicBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            IconButton(
              onPressed:
                  controller.currentPage.value < controller.totalPages.value
                      ? () {
                          controller.addPagination();
                        }
                      : null,
              icon: const Icon(
                FluentIcons.chevron_right_24_regular,
                color: HumiColors.humicBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _dateBox(String label, DateTime date) {
  return Column(
    children: [
      Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          textStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: HumiColors.humicBlackColor,
          ),
        ),
      ),
      verticalSpace(2),
      Container(
        width: 47,
        height: 55,
        decoration: BoxDecoration(
          color: HumiColors.humicWhiteColor,
          border: Border.all(
              color: HumiColors.humicBorderPlanningContainerColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getMonthName(date.month),
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
            ),
            Container(
              width: 37,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: HumiColors.humicWhiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    color: HumiColors.humicBlackColor.withOpacity(0.08),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "${date.day}",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

String _getMonthName(int month) {
  const monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return monthNames[month - 1];
}
