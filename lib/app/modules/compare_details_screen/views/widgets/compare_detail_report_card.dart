import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning_compare.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicDetailCompareReport extends StatelessWidget {
  const HumicDetailCompareReport({
    super.key,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.data,
  });

  final String eventName;
  final String startDate;
  final String endDate;
  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    // Hitung total secara langsung menggunakan `data`
    final totalBruto =
        data.fold(0, (sum, item) => sum + (item.brutoAmount ?? 0));
    final totalTax = data.fold(0, (sum, item) => sum + (item.taxAmount ?? 0));
    final totalNetto =
        data.fold(0, (sum, item) => sum + (item.nettoAmount ?? 0));

    return Column(
      children: [
        // Kegiatan
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Kegiatan",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
            ),
            Text(
              eventName,
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HumiColors.humicBlackColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(24),

        // Start Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start date",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
            ),
            Text(
              startDate,
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HumiColors.humicBlackColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(24),

        // End Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "End date",
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
            ),
            Text(
              endDate,
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: HumiColors.humicBlackColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(30),
        Text(
          "Items",
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicTransparencyColor,
            ),
          ),
        ),
        verticalSpace(10),

        // Planning Table
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              color: HumiColors.humicWhiteColor,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: HumiColors.humicBlackColor.withOpacity(0.11),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(130),
                2: FixedColumnWidth(130),
                3: FixedColumnWidth(130),
                4: FixedColumnWidth(130),
                5: FixedColumnWidth(130),
              },
              children: [
                // Header Setiap Row
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Tanggal",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Keterangan",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Nilai Bruto",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Nilai Pajak",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Nilai Netto",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Kategori",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicTransparencyColor,
                      ),
                    ),
                  ),
                ]),
                ...data
                    .map((e) => TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              formatDate(e.createdAt),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              '${e.information}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              formatRupiah(e.brutoAmount ?? 0),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              formatRupiah(e.taxAmount ?? 0),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              formatRupiah(e.nettoAmount ?? 0),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "${e.category}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          ),
                        ]))
                    .toList(),

                // Total
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(""),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      formatRupiah(totalBruto),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      formatRupiah(totalTax),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      formatRupiah(totalNetto),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(""),
                  ),
                ]),
              ],
            ),
          ),
        ),
        verticalSpace(80),
        SizedBox(
          width: 175,
          height: 46,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              backgroundColor: HumiColors.humicCancelColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Close',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: HumiColors.humicPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
