import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/planning_add_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_details_screen/views/planning_details_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/planning_screen_controller.dart';

class PlanningScreenView extends GetView<PlanningScreenController> {
  const PlanningScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
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
                    "Planning",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor)),
                  ),
                ],
              ),
              verticalSpace(34),
              GestureDetector(
                onTap: () => Get.to(() => const PlanningDetailsScreenView()),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: HumiColors.humicWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: HumiColors.humicBlackColor.withOpacity(0.11),
                          blurRadius: 14.5,
                          offset: const Offset(3, 4)),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          color: HumiColors.humicPlanningContainerColor,
                          border: Border.all(
                            color: HumiColors.humicBorderPlanningContainerColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Oct",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicBlackColor)),
                            ),
                            verticalSpace(5),
                            Container(
                              width: 34.37,
                              height: 17.18,
                              decoration: BoxDecoration(
                                  color: HumiColors.humicWhiteColor,
                                  borderRadius: BorderRadius.circular(3.44),
                                  boxShadow: [
                                    BoxShadow(
                                        color: HumiColors.humicBlackColor
                                            .withOpacity(0.8),
                                        blurRadius: 4.3,
                                        offset: const Offset(0, 1.72),
                                        spreadRadius: 0)
                                  ]),
                              child: Center(
                                child: Text(
                                  "15",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: HumiColors.humicBlackColor)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(6),
                      Text(
                        "Plan For Conference A",
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: HumiColors.humicBlackColor)),
                      ),
                      horizontalSpace(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "80% Achieved",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor)),
                          ),
                          Text(
                            "Rp300.000.000",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicPrimaryColor)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              verticalSpace(8),
              Container(
                width: double.infinity,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: HumiColors.humicWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: HumiColors.humicBlackColor.withOpacity(0.11),
                        blurRadius: 14.5,
                        offset: const Offset(3, 4)),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HumiColors.humicPlanningContainerColor,
                        border: Border.all(
                          color: HumiColors.humicBorderPlanningContainerColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Oct",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor)),
                          ),
                          verticalSpace(5),
                          Container(
                            width: 34.37,
                            height: 17.18,
                            decoration: BoxDecoration(
                                color: HumiColors.humicWhiteColor,
                                borderRadius: BorderRadius.circular(3.44),
                                boxShadow: [
                                  BoxShadow(
                                      color: HumiColors.humicBlackColor
                                          .withOpacity(0.8),
                                      blurRadius: 4.3,
                                      offset: const Offset(0, 1.72),
                                      spreadRadius: 0)
                                ]),
                            child: Center(
                              child: Text(
                                "16",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicBlackColor)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(6),
                    Text(
                      "Plan For Conference B",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    ),
                    horizontalSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "100% Achieved",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor)),
                        ),
                        Text(
                          "Rp300.000.000",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicSecondaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Container(
                width: double.infinity,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: HumiColors.humicWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: HumiColors.humicBlackColor.withOpacity(0.11),
                        blurRadius: 14.5,
                        offset: const Offset(3, 4)),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HumiColors.humicPlanningContainerColor,
                        border: Border.all(
                          color: HumiColors.humicBorderPlanningContainerColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Oct",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor)),
                          ),
                          verticalSpace(5),
                          Container(
                            width: 34.37,
                            height: 17.18,
                            decoration: BoxDecoration(
                                color: HumiColors.humicWhiteColor,
                                borderRadius: BorderRadius.circular(3.44),
                                boxShadow: [
                                  BoxShadow(
                                      color: HumiColors.humicBlackColor
                                          .withOpacity(0.8),
                                      blurRadius: 4.3,
                                      offset: const Offset(0, 1.72),
                                      spreadRadius: 0)
                                ]),
                            child: Center(
                              child: Text(
                                "17",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: HumiColors.humicBlackColor)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(6),
                    Text(
                      "Plan For Conference C",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    ),
                    horizontalSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "80% Achieved",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor)),
                        ),
                        Text(
                          "Rp300.000.000",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicPrimaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 138,
        height: 51,
        child: FloatingActionButton(
          onPressed: () => Get.to(
            const PlanningAddScreenView(),
          ),
          backgroundColor: HumiColors.humicPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Icon(
                  FluentIcons.add_16_regular,
                  color: HumiColors.humicWhiteColor,
                ),
              ),
              horizontalSpace(4),
              Text(
                "Add Plan",
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicWhiteColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
