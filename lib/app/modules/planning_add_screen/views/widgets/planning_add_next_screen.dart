import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/controllers/planning_add_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_item_screen.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';

class PlanningAddNextScreen extends StatelessWidget {
  final int? id;

  const PlanningAddNextScreen({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlanningAddScreenController());
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
                    "Add Plan",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: HumiColors.humicBlackColor)),
                  ),
                ],
              ),
              verticalSpace(32),
              const Divider(
                color: HumiColors.humicBackgroundColor,
                height: 2,
              ),
              verticalSpace(20),

              // Nama Kegiatan
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kegiatan",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    controller.namePlan.text,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(40),

              // Start Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Start Date",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    controller.startDate.text,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "End Date",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    controller.endDate.text,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(40),
              Center(
                child: Text(
                  "Items",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: HumiColors.humicTransparencyColor,
                    ),
                  ),
                ),
              ),
              verticalSpace(10),

              //Planning Table
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                    color: HumiColors.humicWhiteColor,
                    border: Border.all(color: HumiColors.humicWhiteColor),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 24,
                          spreadRadius: 6,
                          offset: const Offset(0, 4),
                          color: HumiColors.humicBlackColor.withOpacity(0.05)),
                    ]),
                child: Obx(
                  () => controller.rows.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image:
                                  AssetImage(HumicImages.humicNoItemFoundIcon),
                            ),
                            verticalSpace(8),
                            Text(
                              "No item found",
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicTransparencyColor),
                              ),
                            ),
                          ],
                        )
                      : SingleChildScrollView(
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
                                6: FixedColumnWidth(40),
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
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Keterangan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Nilai Bruto",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Nilai Pajak",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Nilai Netto",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Kategori",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                ]),

                                // Value Row 1
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        controller.tanggalItem.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Text(
                                        controller.keteranganItem.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        controller.nilaiBrutoItem.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        controller.nilaiPajakItem.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        controller.nilaiNettoItem.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, top: 8, bottom: 8),
                                      child: Text(
                                        "Berhasil",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicBlackColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: HumiColors.humicPrimaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Iconify(
                                          MaterialSymbols.delete,
                                          size: 24,
                                          color: HumiColors.humicWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Value Hasil
                                const TableRow(
                                  children: [
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),

              verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HumiColors.humicCancelColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        'Exit',
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicPrimaryColor)),
                      ),
                    ),
                  ),
                  horizontalSpace(6),
                  SizedBox(
                    width: 160,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => PlanningAddItemScreen(
                            id: id,
                          )),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HumiColors.humicPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            FluentIcons.add_12_regular,
                            color: HumiColors.humicWhiteColor,
                            size: 20,
                          ),
                          horizontalSpace(5),
                          Text(
                            'Add Item',
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicWhiteColor)),
                          ),
                        ],
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

Future<void> selectDate(BuildContext context) async {
  final controller = Get.put(PlanningAddScreenController());
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    controller.selectedDate.value =
        DateFormat('dd MMMM yyyy').format(picked) as DateTime;
  }
}
