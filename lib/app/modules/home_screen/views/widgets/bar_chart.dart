import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class HumicIncomeExpenseChart extends StatelessWidget {
  const HumicIncomeExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Obx(() {
      // Ambil data dari controller
      var monthlyData =
          controller.dashboardData.value.data?.monthlyIncomeExpenseData;

      // Jika data tidak tersedia, tampilkan indikator loading// Fungsi untuk memformat nama bulan menjadi singkatan tiga huruf
      if (monthlyData == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Income & Expenses",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),

              // Widget Tahun
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: HumiColors.humicDividerColor),
                ),

                // Data Tahun
                child: // Widget Tahun
                    Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: HumiColors
                        .humicBackgroundColor, // Warna latar belakang dropdown
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: controller.selectedBarChartYear.value,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 1,
                        color: HumiColors
                            .humicBackgroundColor, // Sesuaikan warna ikon
                      ),
                      onChanged: (int? newValue) {
                        if (newValue != null &&
                            newValue != controller.selectedBarChartYear.value) {
                          controller.updateBarChartYear(newValue);
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
          verticalSpace(12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 250,
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      maxY: 280000,
                      barGroups: monthlyData.asMap().entries.map((entry) {
                        int index = entry.key;
                        var income = entry.value.income?.toDouble() ?? 0;
                        var expense = entry.value.expense?.toDouble() ?? 0;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: income,
                              color: Colors.green,
                              width: 15,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                              ),
                            ),
                            BarChartRodData(
                              toY: expense,
                              color: Colors.red,
                              width: 15,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 90,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 0:
                                  return const Text('0',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                case 50000:
                                  return const Text('50.000',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                case 100000:
                                  return const Text('100.000',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                case 150000:
                                  return const Text('150.000',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                case 200000:
                                  return const Text('200.000',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                case 250000:
                                  return const Text('250.000',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10));
                                default:
                                  return const Text('');
                              }
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value.toInt() >= monthlyData.length) {
                                return const Text('');
                              }
                              return Text(
                                controller.formatMonth(
                                    monthlyData[value.toInt()].name ?? ''),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 10),
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      barTouchData: BarTouchData(enabled: false),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
