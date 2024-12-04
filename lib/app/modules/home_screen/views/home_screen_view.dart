import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/filter_screen/views/filter_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/bar_chart.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/custom_carousel.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/home_custom_appbar.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/planning_pie_chart.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/header_pie_chart.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_data.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/realization_pie_chart.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    final bottomNavbarController = Get.put(BottomNavigationBarController());
    return GetBuilder<HomeScreenController>(
      builder: (_) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(24),
                            HumicCustomAppBar(
                              title: 'Dashboard',
                              widget: GestureDetector(
                                onTap: () =>
                                    Get.to(() => const ProfileScreenView()),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration:
                                      const BoxDecoration(shape: BoxShape.circle),
                                  child: ClipOval(
                                    // child: Image.network(
                                    //   "https://payroll.humicprototyping.com/storage/app/public/${controller.userProfileData?.image}",
                                    //   width: 60,
                                    //   height: 60,
                                    //   fit: BoxFit.cover,
                                    //   // loadingBuilder: (BuildContext context,
                                    //   //     Widget child,
                                    //   //     ImageChunkEvent? loadingProgress) {
                                    //   //   if (loadingProgress == null) {
                                    //   //     return child;
                                    //   //   } else {
                                    //   //     return Center(
                                    //   //       child: CircularProgressIndicator(
                                    //   //         value: loadingProgress
                                    //   //                     .expectedTotalBytes !=
                                    //   //                 null
                                    //   //             ? loadingProgress
                                    //   //                     .cumulativeBytesLoaded /
                                    //   //                 (loadingProgress
                                    //   //                         .expectedTotalBytes ??
                                    //   //                     1)
                                    //   //             : null,
                                    //   //       ),
                                    //   //     );
                                    //   //   }
                                    //   // },
                                    //   errorBuilder: (_,
                                    //       __, ___) {
                                    //     return Text('Your error widget...');
                                    //   },
                                    // ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://payroll.humicprototyping.com/storage/app/public/${controller.userProfileData?.image}",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(
                                        color: HumiColors.humicPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // image:
                              //     "https://payroll.humicprototyping.com/storage/app/public/${controller.userProfileData?.image}",
                            ),
                            verticalSpace(18),
        
                            // Carousel Balance
                            const HumiCarouselSlider(),
                            verticalSpace(24),
        
                            // Income and Expenses Bar Chart
                            const HumicIncomeExpenseChart(),
                            verticalSpace(32),
        
                            // Planning Pie Chart Header
                            const HumicPlanningPieChart(),
                            verticalSpace(24),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Tampilan "Planning" atau "Realization"
                                  if (controller.isPlanningRealization.value)
                                    PlanningPieChart()
                                  else
                                    const RealizationPieChart()
                                ],
                              ),
                            ),
                            verticalSpace(24),
        
                            // Button to Planning Screen
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  bottomNavbarController.changeIndex(1);
                                  Get.to(() => const BottomNavigationBarView());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HumiColors.humicPrimaryColor,
                                ),
                                child: Text(
                                  "More Detail",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            verticalSpace(12),
        
                            // humicHomeApproval(),
        
                            // verticalSpace(32),
        
                            // Transaction History
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Transaction History",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor)),
                                ),
        
                                // Filter Feature
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      enableDrag: false,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Container(
                                        height: 500,
                                        decoration: const BoxDecoration(
                                          color: HumiColors.humicWhiteColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: FilterScreenView(
                                          onApplyFilter: (String selectedType) {
                                            controller.updateTransactionTypeFilter(
                                                selectedType);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FluentIcons.filter_24_filled,
                                      ),
                                      horizontalSpace(5),
                                      Text(
                                        'Filter',
                                        style: GoogleFonts.plusJakartaSans(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors.humicBlackColor)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            verticalSpace(18),
        
                            // -- RESTFUL API
                            const HumicTransactionData(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
      }
    );
  }
}
