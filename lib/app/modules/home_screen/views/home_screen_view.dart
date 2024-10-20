import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/filter_screen/views/filter_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/custom_carousel.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/home_custom_appbar.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_data.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
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
                        const HumicHomeCustomAppBar(),
                        verticalSpace(18),

                        // Container Balance
                        const HumiCarouselSlider(),
                        verticalSpace(24),

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
}
