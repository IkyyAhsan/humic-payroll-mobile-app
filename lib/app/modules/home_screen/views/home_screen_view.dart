import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/filter_screen/views/filter_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dashboard",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => const ProfileScreenView()),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  child: Image(
                                      image: AssetImage(
                                          HumicImages.humicProfileImage)),
                                ),
                              ),
                            )
                          ],
                        ),
                        verticalSpace(18),

                        // Container Balance
                        CarouselSlider(
                            options: CarouselOptions(
                                height: 120,
                                viewportFraction: 0.5,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                initialPage: 1),
                            items: [
                              Container(
                                width: 172,
                                height: 117,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: HumiColors.humicPrimaryColor,
                                    )),
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Monthly Expenses",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: HumiColors.humicBlackColor),
                                      ),
                                    ),
                                    Text(
                                      "Rp0",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: HumiColors.humicBlackColor),
                                      ),
                                    ),
                                    //Text("Rp${controller.dashboardData!.data.monthlyExpense}", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: HumiColors.humicBlackColor),),),
                                  ],
                                ),
                              ),
                              Container(
                                width: 172,
                                height: 117,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: HumiColors.humicPrimaryColor,
                                    border: Border.all(
                                      color: HumiColors.humicPrimaryColor,
                                    )),
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Balance",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: HumiColors.humicWhiteColor),
                                      ),
                                    ),
                                    Text(
                                      "Rp0",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: HumiColors.humicWhiteColor),
                                      ),
                                    ),
                                    //Text("Rp${controller.dashboardData!.data.ballance}", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: HumiColors.humicWhiteColor),),),
                                  ],
                                ),
                              ),
                              Container(
                                width: 172,
                                height: 117,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: HumiColors.humicPrimaryColor,
                                    )),
                                padding:
                                    const EdgeInsets.only(left: 18, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Home Income",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: HumiColors.humicBlackColor),
                                      ),
                                    ),
                                    Text(
                                      "Rp0",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: HumiColors.humicBlackColor),
                                      ),
                                    ),
                                    //Text("Rp${controller.dashboardData!.data.ballance}", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: HumiColors.humicBlackColor),),),
                                  ],
                                ),
                              ),
                            ]),
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
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => const FilterScreenView()),
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

                        // RESTFUL API
                        // ListView.builder(
                        //   itemCount: controller
                        //       .dashboardData?.data.transactionList.data.length,
                        //   shrinkWrap: true,
                        //   primary: false,
                        //   itemBuilder: (context, index) {
                        //     var data = controller.dashboardData!.data
                        //         .transactionList.data[index];
                        //     return GestureDetector(
                        //       onTap: () =>
                        //           Get.to(() => const IncomeScreenView()),
                        //       child: Container(
                        //         width: double.infinity,
                        //         height: 100,
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: HumiColors.humicTransparencyColor,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //         padding: const EdgeInsets.only(
                        //             left: 24, right: 24, top: 24),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               children: [
                        //                 verticalSpace(12),
                        //                 const Image(
                        //                   image: AssetImage(HumicImages
                        //                       .humicIncomeSelectedIcon),
                        //                   color: HumiColors.humicSecondaryColor,
                        //                   width: 32,
                        //                 ),
                        //                 Text(
                        //                   "Income",
                        //                   style: GoogleFonts.plusJakartaSans(
                        //                       textStyle: const TextStyle(
                        //                           fontSize: 12.5,
                        //                           fontWeight: FontWeight.w600,
                        //                           color: HumiColors
                        //                               .humicSecondaryColor)),
                        //                 )
                        //               ],
                        //             ),
                        //             Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(
                        //                   "03 Okt 2024",
                        //                   style: GoogleFonts.plusJakartaSans(
                        //                       textStyle: const TextStyle(
                        //                           fontSize: 12,
                        //                           fontWeight: FontWeight.bold,
                        //                           color: HumiColors
                        //                               .humicPrimaryColor)),
                        //                 ),
                        //                 Text(
                        //                   "Conference 1",
                        //                   style: GoogleFonts.plusJakartaSans(
                        //                       textStyle: const TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.bold,
                        //                           color: HumiColors
                        //                               .humicBlackColor)),
                        //                 ),
                        //                 Text(
                        //                   "Rp600.000.000",
                        //                   style: GoogleFonts.plusJakartaSans(
                        //                       textStyle: const TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w600,
                        //                           color: HumiColors
                        //                               .humicTransparencyColor)),
                        //                 )
                        //               ],
                        //             ),
                        //             Container(
                        //               width: 71,
                        //               height: 23.67,
                        //               decoration: BoxDecoration(
                        //                 borderRadius:
                        //                     BorderRadius.circular(3.16),
                        //                 color: const Color(0xFF48B121)
                        //                     .withOpacity(0.16),
                        //               ),
                        //               child: Center(
                        //                   child: Text(
                        //                 "Approved",
                        //                 style: GoogleFonts.plusJakartaSans(
                        //                     textStyle: const TextStyle(
                        //                         fontSize: 11,
                        //                         fontWeight: FontWeight.w600,
                        //                         color: Color(0xFF48B121))),
                        //               )),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        //First History

                        verticalSpace(12),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
