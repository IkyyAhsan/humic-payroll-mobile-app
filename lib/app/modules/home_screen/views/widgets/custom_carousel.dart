import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/rupiah.dart';

class HumiCarouselSlider extends StatelessWidget {
  const HumiCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return CarouselSlider(
        options: CarouselOptions(
            height: 120,
            viewportFraction: 0.5,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 1),
        items: [
          Container(
            width: 172,
            height: 117,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: HumiColors.humicPrimaryColor,
                )),
            padding: const EdgeInsets.only(left: 18, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Monthly Expenses",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor),
                  ),
                ),
                Text(
                  formatRupiah(
                      (controller.dashboardData.value?.data?.monthlyExpense) ??
                          0),
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HumiColors.humicBlackColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 172,
            height: 117,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HumiColors.humicPrimaryColor,
                border: Border.all(
                  color: HumiColors.humicPrimaryColor,
                )),
            padding: const EdgeInsets.only(left: 18, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Balance",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicWhiteColor),
                  ),
                ),
                Text(
                  formatRupiah(
                      (controller.dashboardData.value?.data?.ballance) ?? 0),
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HumiColors.humicWhiteColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 172,
            height: 117,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: HumiColors.humicPrimaryColor,
                )),
            padding: const EdgeInsets.only(left: 18, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Monthly Income",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HumiColors.humicBlackColor),
                  ),
                ),
                Text(
                  formatRupiah(
                      (controller.dashboardData.value?.data?.monthlyIncome ??
                          0)),
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HumiColors.humicBlackColor),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
