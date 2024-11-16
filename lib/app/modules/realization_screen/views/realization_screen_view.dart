import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/home_custom_appbar.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_detail_screen/views/realization_detail_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_edit_screen/controllers/realization_edit_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_edit_screen/views/realization_edit_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:lottie/lottie.dart';
import '../controllers/realization_screen_controller.dart';

class RealizationScreenView extends GetView<RealizationScreenController> {
  const RealizationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeController = Get.put(HomeScreenController());
    Get.put(RealizationScreenController());
    return GetBuilder<RealizationScreenController>(
      init: RealizationScreenController(),
      builder: (context) {
        return controller.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(
                    color: HumiColors.humicPrimaryColor,
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: HumiColors.humicBackgroundColor,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(24),
                          HumicCustomAppBar(
                            title: 'Realization',
                            image:
                                "https://payroll.humicprototyping.com/storage/app/public/${homeController.userProfileData?.image}",
                          ),
                          verticalSpace(34),
                          if (controller.realizationData.data?.data == null)
                            Center(
                              child: Column(
                                children: [
                                  verticalSpace(150),
                                  Lottie.asset(HumicImages.humicDataNotFound,
                                      height: 170),
                                ],
                              ),
                            )
                          else
                            ListView.builder(
                              itemCount:
                                  controller.realizationData.data?.data?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = controller
                                    .realizationData.data?.data?[index];
                                return GestureDetector(
                                  onTap: () => Get.to(
                                    () => const RealizationDetailScreenView(),
                                    arguments: {'id': data?.id},
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 95,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HumiColors.humicWhiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 16,
                                            offset: const Offset(0, 4),
                                            color: HumiColors.humicBlackColor
                                                .withOpacity(0.07),
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //First Planning
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Status, Name, and Total
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                          color: (data?.status ==
                                                                      'approve' ||
                                                                  data?.status ==
                                                                      'Approve')
                                                              ? HumiColors
                                                                  .humicSecondaryColor
                                                                  .withOpacity(
                                                                      0.12)
                                                              : (data?.status ==
                                                                          'decline' ||
                                                                      data?.status ==
                                                                          'Decline')
                                                                  ? HumiColors
                                                                      .humicPrimaryColor
                                                                      .withOpacity(
                                                                          0.12)
                                                                  : HumiColors
                                                                      .humicThirdSecondaryColor
                                                                      .withOpacity(
                                                                          0.12),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Center(
                                                        child: Text(
                                                          "${data?.status}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .plusJakartaSans(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: (data?.status ==
                                                                          'approve' ||
                                                                      data?.status ==
                                                                          'Approve')
                                                                  ? HumiColors
                                                                      .humicSecondaryColor
                                                                  : (data?.status ==
                                                                              'decline' ||
                                                                          data?.status ==
                                                                              'Decline')
                                                                      ? HumiColors
                                                                          .humicPrimaryColor
                                                                      : HumiColors
                                                                          .humicThirdSecondaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    horizontalSpace(4),
                                                    Container(
                                                      width: 50,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                        color: HumiColors
                                                            .humicBlackColor
                                                            .withOpacity(0.05),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${data?.itemCount} Items',
                                                          style: GoogleFonts.plusJakartaSans(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: HumiColors
                                                                      .humicTransparencyColor)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "${data?.title}",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: GoogleFonts
                                                        .plusJakartaSans(
                                                      textStyle: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: HumiColors
                                                              .humicBlackColor),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Total Netto: ${formatRupiah(int.tryParse(data?.itemSumNettoAmount ?? '0') ?? 0)}",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: HumiColors
                                                          .humicPrimaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            Obx(
                                              () => controller.isEditMode.value
                                                  ? ElevatedButton(
                                                      onPressed: () {
                                                        Get.delete<
                                                            RealizationEditScreenController>();

                                                        Get.to(
                                                            () =>
                                                                const RealizationEditScreenView(),
                                                            arguments: {
                                                              'id': data?.id
                                                            })?.then((_) {
                                                          controller
                                                              .getRealizationData();
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  HumiColors
                                                                      .humicCancelColor),
                                                      child: Row(
                                                        children: [
                                                          const Iconify(
                                                            Bx.edit,
                                                            color: HumiColors
                                                                .humicPrimaryColor,
                                                            size: 16,
                                                          ),
                                                          horizontalSpace(4),
                                                          Text(
                                                            "Edit",
                                                            style: GoogleFonts.plusJakartaSans(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: HumiColors
                                                                        .humicPrimaryColor)),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Row(
                                                      children: [
                                                        _dateBox(
                                                            "Start",
                                                            data?.startDate ??
                                                                DateTime.now()),
                                                        horizontalSpace(5),
                                                        _dateBox(
                                                            "End",
                                                            data?.endDate ??
                                                                DateTime.now()),
                                                      ],
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          verticalSpace(16),
                        ],
                      ),
                    ),
                  ),
                ),
                // Add Plan
                floatingActionButton: Obx(
                  () => SizedBox(
                    width: 138,
                    height: 51,
                    child: FloatingActionButton(
                      onPressed: controller.toggleEditMode,
                      backgroundColor: HumiColors.humicPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.isEditMode.value
                              ? const Iconify(
                                  Bx.x_circle,
                                  color: HumiColors.humicWhiteColor,
                                  size: 16,
                                )
                              : const Iconify(
                                  Bx.edit,
                                  color: HumiColors.humicWhiteColor,
                                  size: 16,
                                ),
                          horizontalSpace(4),
                          Text(
                            controller.isEditMode.value ? "Close" : "Edit",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
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
            color: HumiColors.humicBorderPlanningContainerColor,
            width: 2,
          ),
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
