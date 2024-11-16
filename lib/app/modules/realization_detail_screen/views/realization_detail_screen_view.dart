import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';
import '../controllers/realization_detail_screen_controller.dart';

class RealizationDetailScreenView
    extends GetView<RealizationDetailScreenController> {
  const RealizationDetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RealizationDetailScreenController());

    return GetBuilder<RealizationDetailScreenController>(
      builder: (controller) {
        int totalBruto = 0;
        int totalTax = 0;
        int totalNetto = 0;

        if (controller.realizationDetailData?.data?.item != null) {
          for (var data in controller.realizationDetailData!.data!.item!) {
            totalBruto +=
                int.tryParse(data.brutoAmount?.toString() ?? '0') ?? 0;
            totalTax += int.tryParse(data.taxAmount?.toString() ?? '0') ?? 0;
            totalNetto +=
                int.tryParse(data.nettoAmount?.toString() ?? '0') ?? 0;
          }
        }

        return controller.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(
                    color: HumiColors.humicPrimaryColor,
                  ),
                ),
              )
            : Scaffold(
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
                              ),
                            ),
                            horizontalSpace(16),
                            Text(
                              "Realization Details",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: HumiColors.humicBlackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(48),
                        Column(
                          children: [
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
                                  controller
                                          .realizationDetailData?.data?.title ??
                                      '',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Start Date",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicTransparencyColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  formatDate(
                                    controller
                                        .realizationDetailData?.data?.startDate,
                                  ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "End Date",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicTransparencyColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  formatDate(
                                    controller
                                        .realizationDetailData?.data?.endDate,
                                  ),
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
                            Visibility(
                              visible: controller.realizationDetailData?.data !=
                                  null,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HumiColors.humicWhiteColor,
                                    borderRadius: BorderRadius.circular(9),
                                    boxShadow: [
                                      BoxShadow(
                                        color: HumiColors.humicBlackColor
                                            .withOpacity(0.11),
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
                                      const TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Tanggal",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Keterangan",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Nilai Bruto",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Nilai Pajak",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Nilai Netto",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Kategori",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      ...?controller
                                              .realizationDetailData?.data?.item
                                              ?.map(
                                            (data) {
                                              return TableRow(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      tableDateFormat(
                                                        data.createdAt ??
                                                            DateTime.now(),
                                                      ),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      data.information ?? "",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      formatRupiah(
                                                        data.brutoAmount ?? 0,
                                                      ),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      formatRupiah(
                                                        data.taxAmount ?? 0,
                                                      ),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      formatRupiah(
                                                        data.nettoAmount ?? 0,
                                                      ),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                      data.category ?? "",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HumiColors
                                                            .humicBlackColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          [],
                                      TableRow(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "Total",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors
                                                    .humicPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(""),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              formatRupiah(totalBruto),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors
                                                    .humicPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              formatRupiah(totalTax),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors
                                                    .humicPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              formatRupiah(totalNetto),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: HumiColors
                                                    .humicPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(""),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
