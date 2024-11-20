import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_add_item_screen/views/realization_add_item_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_edit_screen/controllers/realization_edit_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';

class RealizationEditScreenView
    extends GetView<RealizationEditScreenController> {
  const RealizationEditScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealizationEditScreenController());
    return GetBuilder<RealizationEditScreenController>(
      builder: (context) {
        int totalBruto = 0;
        int totalTax = 0;
        int totalNetto = 0;

        if (controller.realizationDetailData?.data?.item != null) {
          for (var data in controller.realizationDetailData?.data?.item ?? []) {
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
                                )),
                            horizontalSpace(16),
                            Text(
                              "Realization Details",
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
                                  "${controller.realizationDetailData?.data?.title}",
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

                            //Start Date
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
                                  formatDate(controller
                                      .realizationDetailData?.data?.startDate),
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

                            //End Date
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
                                  formatDate(controller
                                      .realizationDetailData?.data?.endDate),
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

                            // Realization Table
                            SingleChildScrollView(
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
                                    6: FixedColumnWidth(100),
                                  },
                                  children: [
                                    //Header setiap Row
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
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                            bottom: 8,
                                            left: 24),
                                        child: Text(
                                          "Action",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: HumiColors.humicBlackColor,
                                          ),
                                        ),
                                      ),
                                    ]),

                                    // Row of Value
                                    ...?controller
                                        .realizationDetailData?.data?.item
                                        ?.asMap()
                                        .entries
                                        .map(
                                      (entry) {
                                        int index = entry.key;
                                        var data = entry.value;
                                        return TableRow(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                tableDateFormat(data.createdAt),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                data.information ?? "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                formatRupiah(int.parse(data
                                                    .brutoAmount
                                                    .toString())),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                formatRupiah(int.parse(
                                                    data.taxAmount.toString())),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                formatRupiah(int.parse(data
                                                    .nettoAmount
                                                    .toString())),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                data.category ?? "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 40,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color: HumiColors
                                                          .humicPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Icon(
                                                      FluentIcons
                                                          .edit_24_regular,
                                                      size: 16,
                                                      color: HumiColors
                                                          .humicWhiteColor,
                                                    ),
                                                  ),
                                                ),
                                                horizontalSpace(12),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .delete(data.id ?? 0);
                                                  },
                                                  child: Container(
                                                    width: 40,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color: HumiColors
                                                          .humicPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: const Icon(
                                                      FluentIcons
                                                          .delete_24_regular,
                                                      size: 16,
                                                      color: HumiColors
                                                          .humicWhiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                                    // Value Total
                                    TableRow(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            formatRupiah(totalBruto),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            formatRupiah(totalTax),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            formatRupiah(totalNetto),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
                                  final controller =
                                      Get.put(BottomNavigationBarController());
                                  controller.selectedIndex.value = 2;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HumiColors.humicPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Close",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicWhiteColor,
                                    ),
                                  ),
                                )),
                            horizontalSpace(4),
                            ElevatedButton(
                                onPressed: () =>
                                    Get.to(
                                        () =>
                                            const RealizationAddItemScreenView(),
                                        arguments: {
                                          "id": controller
                                              .realizationDetailData?.data?.id
                                        }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HumiColors.humicPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      FluentIcons.add_12_regular,
                                      color: HumiColors.humicWhiteColor,
                                      size: 16,
                                    ),
                                    horizontalSpace(5),
                                    Text(
                                      'Add Item',
                                      style: GoogleFonts.plusJakartaSans(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicWhiteColor)),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
