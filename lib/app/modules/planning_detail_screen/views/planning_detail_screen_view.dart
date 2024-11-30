import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_detail_screen/controllers/planning_detail_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/table_date_format.dart';
import 'package:lottie/lottie.dart';

class PlanningDetailScreenView extends GetView<PlanningDetailScreenController> {
  const PlanningDetailScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PlanningDetailScreenController());

    return GetBuilder<PlanningDetailScreenController>(builder: (context) {
      int totalBruto = 0;
      int totalTax = 0;
      int totalNetto = 0;

      if (controller.planningDetailData?.data?.item != null) {
        for (var data in controller.planningDetailData!.data!.item!) {
          totalBruto += int.parse(data.brutoAmount.toString());
          totalTax += int.parse(data.taxAmount.toString());
          totalNetto += int.parse(data.nettoAmount.toString());
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
                  child: SingleChildScrollView(
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
                        IntrinsicHeight(
                          child: Column(
                            children: [
                              // Kegiatan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Kegiatan",
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller
                                            .planningDetailData?.data?.title ??
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

                              // Start Date
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Start Date",
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatDate(controller
                                        .planningDetailData?.data?.createdAt),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "End Date",
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatDate(controller
                                        .planningDetailData?.data?.endDate),
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

                              // Planning table
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
                                      ]),

                                      // Row of Value
                                      ...controller
                                          .planningDetailData!.data!.item!
                                          .map((data) {
                                        return TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              tableDateFormat(data.createdAt),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "${data.information}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    HumiColors.humicBlackColor,
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
                                                color:
                                                    HumiColors.humicBlackColor,
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
                                                color:
                                                    HumiColors.humicBlackColor,
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
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              "${data.category}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    HumiColors.humicBlackColor,
                                              ),
                                            ),
                                          ),
                                        ]);
                                      }),

                                      // Value Total
                                      TableRow(children: [
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
                                            "", // Kosong untuk kolom informasi
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
                                            "", // Kosong untuk kolom kategori
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  HumiColors.humicPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpace(20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 45,
                                    width: 45,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        bool? confirm = await showDialog(
                                          context: Get.context!,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              child: SizedBox(
                                                width: 330,
                                                height: 420,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Lottie.asset(
                                                          HumicImages
                                                              .humicDeclineConfirmation,
                                                          width: 250), //288),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Text(
                                                        'Apakah Anda yakin untuk menghapus?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: HumiColors
                                                              .humicBlackColor,
                                                        ),
                                                      ),
                                                      verticalSpace(32),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 128,
                                                            height: 43,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(
                                                                        false); // Tidak setuju
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    HumiColors
                                                                        .humicCancelColor,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                              ),
                                                              child: Text(
                                                                'Cancel',
                                                                style: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: HumiColors
                                                                        .humicPrimaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpace(10),
                                                          SizedBox(
                                                            width: 128,
                                                            height: 43,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                controller.deletePlanning(
                                                                    id: controller
                                                                        .planningDetailData
                                                                        ?.data
                                                                        ?.id);

                                                                Get.offAllNamed(
                                                                    Routes
                                                                        .BOTTOM_NAVIGATION_BAR);
                                                                final navbarController =
                                                                    Get.put(
                                                                        BottomNavigationBarController());
                                                                navbarController
                                                                    .selectedIndex(
                                                                        1);

                                                                Get.snackbar(
                                                                  'Success',
                                                                  'Planning has been successfully deleted!',
                                                                  backgroundColor:
                                                                      HumiColors
                                                                          .humicSecondaryColor,
                                                                  colorText:
                                                                      HumiColors
                                                                          .humicWhiteColor,
                                                                );
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      HumiColors
                                                                          .humicPrimaryColor,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                              child: const Text(
                                                                'Delete',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: HumiColors
                                                                        .humicWhiteColor),
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
                                          },
                                        );

                                        if (confirm == true) {
                                          controller.deletePlanning(
                                            id: controller
                                                .planningDetailData?.data?.id,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(),
                                        backgroundColor:
                                            HumiColors.humicPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Icon(
                                        FluentIcons.delete_24_regular,
                                        size: 20,
                                        color: HumiColors.humicWhiteColor,
                                      ),
                                    ),
                                  ),
                                  horizontalSpace(16),
                                  SizedBox(
                                    width: 173,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () => Get.back(),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            HumiColors.humicPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: HumiColors.humicWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
