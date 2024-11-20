import 'package:fl_chart/fl_chart.dart';
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
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/widgets/transaction_data.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    final bottomNavbarController = Get.put(BottomNavigationBarController());
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
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                  "https://payroll.humicprototyping.com/storage/app/public/${controller.userProfileData?.image}",
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
                              // Tampilan "Planning" atau "Transaction"
                              if (controller.isApproveRealization.value)
                                PlanningPieChart()
                              else
                                PlanningPieChart()
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

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Approve",
                        //       style: GoogleFonts.plusJakartaSans(
                        //         textStyle: const TextStyle(
                        //             fontSize: 24,
                        //             fontWeight: FontWeight.w600,
                        //             color: HumiColors.humicBlackColor),
                        //       ),
                        //     ),

                        //     // Toggle Buttons for Planning and Transaction
                        //     Obx(
                        //       () => Row(
                        //         children: [
                        //           ElevatedButton(
                        //             onPressed:
                        //                 controller.approveToggleRealization,
                        //             style: ElevatedButton.styleFrom(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 12),
                        //               backgroundColor:
                        //                   controller.isApproveRealization.value
                        //                       ? HumiColors.humicPrimaryColor
                        //                       : HumiColors.humicWhiteColor,
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(25),
                        //               ),
                        //             ),
                        //             child: Text(
                        //               "Planning",
                        //               style: GoogleFonts.plusJakartaSans(
                        //                 textStyle: TextStyle(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w600,
                        //                   color: controller
                        //                           .isApproveRealization.value
                        //                       ? HumiColors.humicWhiteColor
                        //                       : HumiColors
                        //                           .humicTransparencyColor,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           horizontalSpace(5),
                        //           ElevatedButton(
                        //             onPressed:
                        //                 controller.approveToggleTransaction,
                        //             style: ElevatedButton.styleFrom(
                        //                 padding: const EdgeInsets.symmetric(
                        //                     horizontal: 12),
                        //                 backgroundColor: !controller
                        //                         .isApproveRealization.value
                        //                     ? HumiColors.humicPrimaryColor
                        //                     : HumiColors.humicWhiteColor,
                        //                 shape: RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         BorderRadius.circular(25))),
                        //             child: Text(
                        //               "Transaction",
                        //               style: GoogleFonts.plusJakartaSans(
                        //                 textStyle: TextStyle(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w600,
                        //                   color: !controller
                        //                           .isApproveRealization.value
                        //                       ? HumiColors.humicWhiteColor
                        //                       : HumiColors
                        //                           .humicTransparencyColor,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // verticalSpace(24),
                        // Obx(
                        //   () => Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       if (controller.isApproveRealization.value)
                        //         SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           child: Row(
                        //             children: controller.dashboardData.value
                        //                     .data?.approval?.planning
                        //                     ?.map((planning) {
                        //                   return Container(
                        //                     width: 220,
                        //                     height: 150,
                        //                     margin: const EdgeInsets.only(
                        //                         right: 12),
                        //                     padding: const EdgeInsets.only(
                        //                         left: 18, right: 18, top: 30),
                        //                     decoration: BoxDecoration(
                        //                       border: Border.all(
                        //                         color: const Color(0xFFF3F3F3),
                        //                         width: 3,
                        //                       ),
                        //                       borderRadius:
                        //                           BorderRadius.circular(8),
                        //                     ),
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         Row(
                        //                           children: [
                        //                             Container(
                        //                               width: 60,
                        //                               height: 20,
                        //                               decoration: BoxDecoration(
                        //                                 color: HumiColors
                        //                                     .humicCancelColor
                        //                                     .withOpacity(0.14),
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(3),
                        //                               ),
                        //                               child: Center(
                        //                                 child: Text(
                        //                                   "Planning",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: HumiColors
                        //                                           .humicCancelTextColor,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                             horizontalSpace(5),
                        //                             Container(
                        //                               width: 60,
                        //                               height: 20,
                        //                               decoration: BoxDecoration(
                        //                                 color: HumiColors
                        //                                     .humicBlackColor
                        //                                     .withOpacity(0.05),
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(3),
                        //                               ),
                        //                               child: Center(
                        //                                 child: Text(
                        //                                   "${planning.itemCount ?? 0} Items",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: Color(
                        //                                           0xFF636363),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                         verticalSpace(3),
                        //                         Text(
                        //                           planning.title ?? "Untitled",
                        //                           style: GoogleFonts
                        //                               .plusJakartaSans(
                        //                             textStyle: const TextStyle(
                        //                               fontSize: 12,
                        //                               fontWeight:
                        //                                   FontWeight.w600,
                        //                               color: HumiColors
                        //                                   .humicBlackColor,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         verticalSpace(5),
                        //                         Row(
                        //                           children: [
                        //                             Column(
                        //                               crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .start,
                        //                               children: [
                        //                                 Text(
                        //                                   "Start:",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: Color(
                        //                                           0xFF636363),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                                 Text(
                        //                                   planning.startDate !=
                        //                                           null
                        //                                       ? formatDate(
                        //                                           planning
                        //                                               .startDate)
                        //                                       : "-",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: HumiColors
                        //                                           .humicBlackColor,
                        //                                     ),
                        //                                   ),
                        //                                 )
                        //                               ],
                        //                             ),
                        //                             horizontalSpace(12),
                        //                             Column(
                        //                               crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .start,
                        //                               children: [
                        //                                 Text(
                        //                                   "End:",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: Color(
                        //                                           0xFF636363),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                                 Text(
                        //                                   planning.endDate !=
                        //                                           null
                        //                                       ? formatDate(
                        //                                           planning
                        //                                               .endDate)
                        //                                       : "-",
                        //                                   style: GoogleFonts
                        //                                       .plusJakartaSans(
                        //                                     textStyle:
                        //                                         const TextStyle(
                        //                                       fontSize: 8,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600,
                        //                                       color: HumiColors
                        //                                           .humicBlackColor,
                        //                                     ),
                        //                                   ),
                        //                                 )
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                         verticalSpace(15),
                        //                         Row(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .spaceBetween,
                        //                           children: [
                        //                             SizedBox(
                        //                               width: 85,
                        //                               height: 24,
                        //                               child: ElevatedButton(
                        //                                 onPressed: () {},
                        //                                 style: ElevatedButton
                        //                                     .styleFrom(
                        //                                   shape:
                        //                                       RoundedRectangleBorder(
                        //                                     borderRadius:
                        //                                         BorderRadius
                        //                                             .circular(
                        //                                                 4),
                        //                                   ),
                        //                                   backgroundColor:
                        //                                       HumiColors
                        //                                           .humicCancelColor,
                        //                                 ),
                        //                                 child: Center(
                        //                                   child: Text(
                        //                                     "Denied",
                        //                                     style: GoogleFonts
                        //                                         .plusJakartaSans(
                        //                                       textStyle:
                        //                                           const TextStyle(
                        //                                         fontSize: 8,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .w600,
                        //                                         color: HumiColors
                        //                                             .humicCancelTextColor,
                        //                                       ),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                             SizedBox(
                        //                               width: 85,
                        //                               height: 24,
                        //                               child: ElevatedButton(
                        //                                 onPressed: () {},
                        //                                 style: ElevatedButton
                        //                                     .styleFrom(
                        //                                   shape:
                        //                                       RoundedRectangleBorder(
                        //                                     borderRadius:
                        //                                         BorderRadius
                        //                                             .circular(
                        //                                                 4),
                        //                                   ),
                        //                                   backgroundColor:
                        //                                       HumiColors
                        //                                           .humicPrimaryColor,
                        //                                 ),
                        //                                 child: Center(
                        //                                   child: Text(
                        //                                     "Approve",
                        //                                     style: GoogleFonts
                        //                                         .plusJakartaSans(
                        //                                       textStyle:
                        //                                           const TextStyle(
                        //                                         fontSize: 8,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .w600,
                        //                                         color: HumiColors
                        //                                             .humicWhiteColor,
                        //                                       ),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         )
                        //                       ],
                        //                     ),
                        //                   );
                        //                 }).toList() ??
                        //                 [],
                        //           ),
                        //         )
                        //       else
                        //         const Center(
                        //           child: Text("No Data Available"),
                        //         ),
                        //     ],
                        //   ),
                        // ),

                        verticalSpace(32),

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
}

class PlanningPieChart extends StatelessWidget {
  PlanningPieChart({super.key});

  // Warna untuk setiap label
  final List<Color> colors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.cyan,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());

    return Obx(() {
      // Ambil data dari controller
      var pieChartData = controller.dashboardData.value.data?.pieChart;
      if (pieChartData == null) {
        return const Center(child: CircularProgressIndicator());
      }

      // Konversi data untuk digunakan pada Pie Chart
      List<Map<String, dynamic>> planningData = pieChartData.planningData!
          .asMap()
          .entries
          .map((entry) => {
                'label': entry.value.name,
                'value': entry.value.value,
                'color': colors[entry.key % colors.length],
              })
          .toList();

      // Total planning
      double totalPlanning = pieChartData.totalPlanning?.toDouble() ?? 0;

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0XFFF3F3F3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF636363),
                          ),
                        ),
                      ),
                      Text(
                        '${formatRupiah(totalPlanning.toInt())}',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: HumiColors.humicDividerColor),
                    ),

                    // Data Tahun
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: HumiColors
                            .humicBackgroundColor, // Warna latar belakang dropdown
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: controller.selectedPieChartYear.value,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 1,
                            color: HumiColors
                                .humicBackgroundColor, // Sesuaikan warna ikon
                          ),
                          onChanged: (int? newValue) {
                            if (newValue != null &&
                                newValue !=
                                    controller.selectedPieChartYear.value) {
                              controller.updatePieChartYear(newValue);
                            }
                          },
                          isExpanded: true,
                          alignment: Alignment.center,
                          items: List.generate(
                            5,
                            (index) => DateTime.now().year - index,
                          ).map<DropdownMenuItem<int>>((int year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: Center(
                                child: Row(
                                  children: [
                                    horizontalSpace(10),
                                    Iconify(
                                      Uil.calender,
                                      size: 16,
                                    ),
                                    horizontalSpace(5),
                                    Text(
                                      "$year",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Pie Chart
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 0,
                            sections: planningData.map((data) {
                              final valueInMillions = data['value'] / 1000000;
                              return PieChartSectionData(
                                color: data['color'],
                                value: valueInMillions,
                                title: '',
                                radius: 80,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(16),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: planningData.map((data) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    color: data['color'],
                                  ),
                                  horizontalSpace(8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data['label']},',
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${formatRupiah(data['value'])}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF636363),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
