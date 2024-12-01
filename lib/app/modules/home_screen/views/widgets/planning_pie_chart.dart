import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class PlanningPieChart extends StatelessWidget {
  PlanningPieChart({super.key});

  // Daftar warna yang lebih bervariasi
  final List<Color> predefinedColors = [
    const Color(0xFF1E88E5), // Blue
    const Color(0xFF43A047), 
    const Color(0xFFD32F2F), 
    const Color(0xFFFB8C00),
    const Color(0xFF8E24AA),
    const Color(0xFF0288D1), 
    const Color(0xFF7B1FA2), 
    const Color(0xFFFBC02D), 
    const Color(0xFF0288D1),
    const Color(0xFF009688), 
    const Color(0xFF7C4DFF),
    const Color(0xFFAD1457),
    const Color(0xFF9E9D24),
    const Color(0xFF689F38),
    const Color(0xFFB71C1C),
    const Color(0xFF512DA8), 
    const Color(0xFF303F9F),
    const Color(0xFF8D6E63),
    const Color(0xFF0288D1),
    const Color(0xFFB2FF59), 
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());

    return Obx(() {
      // Ambil data dari controller
      var pieChartData = controller.dashboardData.value.data?.pieChart;
      if (pieChartData == null) {
        return const Center(
            child: CircularProgressIndicator(
          color: HumiColors.humicPrimaryColor,
        ));
      }

      // Konversi data untuk digunakan pada Pie Chart
      List<Map<String, dynamic>> planningData =
          pieChartData.planningData!.asMap().entries.map((entry) {
        Color color = predefinedColors[entry.key % predefinedColors.length];
        return {
          'label': entry.value.name,
          'value': entry.value.value,
          'color': color,
        };
      }).toList();

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
                        formatRupiah(totalPlanning.toInt()),
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor,
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
                                    const Iconify(
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
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        formatRupiah(data['value']),
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
