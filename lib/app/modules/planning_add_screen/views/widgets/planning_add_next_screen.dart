import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/controllers/planning_add_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_item_screen.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/controllers/planning_detail_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';
import 'package:intl/intl.dart';

class PlanningAddNextScreen extends StatelessWidget {
  final int? id;

  const PlanningAddNextScreen({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    var id = Get.arguments['id'];
    final planningDetailController = Get.put(PlanningDetailScreenController());

    int totalBruto = 0;
    int totalTax = 0;
    int totalNetto = 0;

    if (planningDetailController.planningDetailData?.data?.item != null) {
      for (var data
          in planningDetailController.planningDetailData!.data!.item!) {
        totalBruto += int.tryParse(data.brutoAmount?.toString() ?? '0') ?? 0;
        totalTax += int.tryParse(data.taxAmount?.toString() ?? '0') ?? 0;
        totalNetto += int.tryParse(data.nettoAmount?.toString() ?? '0') ?? 0;
      }
    }

    final controller = Get.put(PlanningAddScreenController());
    return GetBuilder<PlanningDetailScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: HumiColors.humicBackgroundColor,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async =>
                planningDetailController.getPlanningDetailData(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                            onPressed: () {
                              Get.back();
                            },
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
                      decoration: BoxDecoration(
                          color: HumiColors.humicWhiteColor,
                          border: Border.all(color: HumiColors.humicWhiteColor),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 24,
                              spreadRadius: 6,
                              offset: const Offset(0, 4),
                              color:
                                  HumiColors.humicBlackColor.withOpacity(0.05),
                            ),
                          ]),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicHeight(
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
                                6: FixedColumnWidth(120),
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
                                    padding: EdgeInsets.only(
                                      top: 8,
                                      right: 8,
                                      bottom: 8,
                                      left: 8,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Action",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              HumiColors.humicTransparencyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),

                                // Row of Value
                                ...?planningDetailController
                                    .planningDetailData?.data?.item
                                    ?.map(
                                  (data) {
                                    return TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            tableDateFormat(data.createdAt),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "${data.information}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            formatRupiah(int.parse(
                                                data.brutoAmount.toString())),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
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
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            formatRupiah(int.parse(
                                                data.nettoAmount.toString())),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "${data.category}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: HumiColors.humicBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Row(
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
                                                    FluentIcons.edit_24_regular,
                                                    size: 16,
                                                    color: HumiColors
                                                        .humicWhiteColor,
                                                  ),
                                                ),
                                              ),
                                              horizontalSpace(8),
                                              GestureDetector(
                                                onTap: () {
                                                  PlanningServices()
                                                      .deleteItem(data.id!);
                                                  planningDetailController
                                                      .getPlanningDetailData();
                                                  planningDetailController
                                                      .update();
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
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                // Value Hasil
                                TableRow(
                                  children: [
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
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicPrimaryColor,
                                        ),
                                      ),
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
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: HumiColors.humicPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    const Padding(
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
                            onPressed: () {
                              Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
                              final controller =
                                  Get.put(BottomNavigationBarController());
                              controller.selectedIndex.value = 1;
                            },
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
                            onPressed: () => Get.to(
                              () => PlanningAddItemScreen(
                                id: id,
                              ),
                            )?.then((_) {
                              planningDetailController.getPlanningDetailData();
                              planningDetailController.update();
                            }),
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
          ),
        ),
      );
    });
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
