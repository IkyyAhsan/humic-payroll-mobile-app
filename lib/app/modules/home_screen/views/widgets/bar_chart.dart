import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class HumicIncomeExpenseChart extends StatelessWidget {
  HumicIncomeExpenseChart({
    super.key,
  });

  final List<Map<String, dynamic>> monthlyData = [
    {'month': 'Jan', 'income': 30000000, 'expense': 20000000},
    {'month': 'Feb', 'income': 40000000, 'expense': 25000000},
    {'month': 'Mar', 'income': 35000000, 'expense': 15000000},
    {'month': 'Apr', 'income': 45000000, 'expense': 30000000},
    {'month': 'Mei', 'income': 30000000, 'expense': 20000000},
    {'month': 'Jun', 'income': 40000000, 'expense': 35000000},
  ];

  @override
  Widget build(BuildContext context) {
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
                    color: HumiColors.humicBlackColor),
              ),
            ),
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFFC4C4C4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Iconify(
                    Uil.calender,
                    size: 16,
                  ),
                  horizontalSpace(4),
                  Text(
                    "2024",
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
          ],
        ),
        verticalSpace(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 300,
            child: AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  maxY: 50000000,
                  barGroups: monthlyData.asMap().entries.map((entry) {
                    int index = entry.key;
                    double income = entry.value['income'].toDouble();
                    double expense = entry.value['expense'].toDouble();
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
                          // Mengganti nama kolom sesuai nilai
                          switch (value.toInt()) {
                            case 0:
                              return const Text('0',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10));
                            case 10000000:
                              return Text('${formatRupiah(10000000)}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10));
                            case 20000000:
                              return Text('${formatRupiah(20000000)}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10));
                            case 30000000:
                              return Text('${formatRupiah(30000000)}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10));
                            case 40000000:
                              return Text('${formatRupiah(40000000)}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10));
                            case 50000000:
                              return Text('${formatRupiah(50000000)}',
                                  style: const TextStyle(
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
                          const months = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'Mei',
                            'Jun'
                          ];
                          return Text(
                            months[value.toInt()],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                          showTitles:
                              false), // Menghilangkan label di sisi kanan
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: false), // Menghilangkan label di atas
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
      ],
    );
  }
}
