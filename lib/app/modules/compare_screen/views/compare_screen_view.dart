import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/views/compare_details_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/compare_screen_controller.dart';

class CompareScreenView extends GetView<CompareScreenController> {
  const CompareScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompareScreenController>(
        init: CompareScreenController(),
        builder: (context) {
          return controller.isLoading
              ? const Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: HumiColors.humicBackgroundColor,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () => Get.back(),
                                    icon: const Icon(
                                      FluentIcons.ios_arrow_ltr_24_regular,
                                      color: HumiColors.humicBlackColor,
                                    )),
                                horizontalSpace(16),
                                Text(
                                  "Compare",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: HumiColors.humicBlackColor)),
                                ),
                              ],
                            ),
                            verticalSpace(20),

                            // First List
                            ...?controller.compare?.data?.data
                                ?.map(
                                  (e) => GestureDetector(
                                    onTap: () => Get.to(
                                        () => const CompareDetailsScreenView(),
                                        arguments: {
                                          "id": e.id,
                                        }),
                                    child: Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              HumiColors.humicTransparencyColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                FluentIcons
                                                    .branch_compare_24_filled,
                                                color: HumiColors
                                                    .humicCompareColor,
                                                size: 36,
                                              ),
                                              Text(
                                                "Compare",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w600,
                                                    color: HumiColors
                                                        .humicCompareColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          horizontalSpace(30),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "03/10/2024 - 21/11/2024",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: HumiColors
                                                        .humicPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 180,
                                                child: Text(
                                                  "${e.title}",
                                                  maxLines: 2,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: HumiColors
                                                          .humicBlackColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${e.status}",
                                                style: GoogleFonts.plusJakartaSans(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicTransparencyColor)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),

                            // Second List
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
