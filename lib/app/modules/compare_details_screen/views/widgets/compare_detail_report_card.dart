import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/controllers/compare_details_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicDetailCompareReport extends StatelessWidget {
  const HumicDetailCompareReport({
    super.key,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    this.eventDate,
    this.eventDescription,
    this.brutoValue,
    this.taxValue,
    this.nettoValue,
    this.category,
  });

  final String eventName;
  final String startDate;
  final String endDate;
  final String? eventDate;
  final String? eventDescription;
  final String? brutoValue;
  final String? taxValue;
  final String? nettoValue;
  final String? category;

  @override
  Widget build(BuildContext context) {
    Get.put(CompareDetailsScreenController());
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
                    color: HumiColors.humicBlackColor),
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
                    color: HumiColors.humicTransparencyColor),
              ),
            ),
            Text(
              startDate,
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor),
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
                    color: HumiColors.humicTransparencyColor),
              ),
            ),
            Text(
              endDate,
              style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor),
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

        //Planning Table
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

                // Value Row 1
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$eventDate",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      "$eventDescription",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$brutoValue",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$taxValue",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$nettoValue",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$category",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  )
                ]),

                // Value Hasil
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Rp200.000.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Rp20.000.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Rp20.000.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  )
                ])
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
                  borderRadius: BorderRadius.circular(10)),
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
