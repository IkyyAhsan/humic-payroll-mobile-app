import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicPlanningDetails extends StatelessWidget {
  const HumicPlanningDetails(
      {super.key,
      required this.activtyName,
      required this.startDate,
      required this.endDate});

  final String activtyName;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        FluentIcons.ios_arrow_ltr_24_regular,
                        color: HumiColors.humicBlackColor,
                      )),
                  horizontalSpace(16),
                  Text(
                    "Planning Details",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor)),
                  ),
                ],
              ),
              verticalSpace(48),
              Column(
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
                        activtyName,
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

                  // Planning table
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
                        children: const [
                          //Header setiap Row
                          TableRow(children: [
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

                          // Value setiap Row 1
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "21/10/2024",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "Ini adalah Keterangan Dari Item 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp200.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Internal",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                          ]),

                          // Value setiap Row 2
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "21/10/2024",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "Ini adalah Keterangan Dari Item 2",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp200.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Internal",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                          ]),

                          // Value setiap Row 3
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "21/10/2024",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "Ini adalah Keterangan Dari Item 3",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp200.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp20.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Eksternal",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                          ]),

                          // Value Total
                          TableRow(children: [
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
                                "Rp600.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicPrimaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp60.000.000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicPrimaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Rp60.000.000",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
