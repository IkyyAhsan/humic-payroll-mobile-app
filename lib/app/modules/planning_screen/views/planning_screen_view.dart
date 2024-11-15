import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/home_custom_appbar.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/planning_add_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/views/widgets/planning_data.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';
import '../controllers/planning_screen_controller.dart';

class PlanningScreenView extends GetView<PlanningScreenController> {
  const PlanningScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeController =
        Get.find<HomeScreenController>();
    Get.put(PlanningScreenController());

    return Obx(
      () {
        return controller.isLoading.value
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: HumiColors.humicPrimaryColor,
                            ),
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(24),
                              HumicCustomAppBar(
                                title: 'Planning',
                                image:
                                    "https://payroll.humicprototyping.com/storage/app/public/${homeController.userProfileData?.image}",
                              ),
                              verticalSpace(34),
                              if (controller.pageData.isEmpty)
                                Center(
                                  child: Column(
                                    children: [
                                      verticalSpace(150),
                                      Lottie.asset(
                                          HumicImages.humicDataNotFound,
                                          height: 170),
                                    ],
                                  ),
                                )
                              else
                                const HumicPlanningData(),
                              verticalSpace(16),
                            ],
                          ),
                        );
                      },
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.add_24_regular,
                          color: HumiColors.humicWhiteColor,
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
      },
    );
  }
}
