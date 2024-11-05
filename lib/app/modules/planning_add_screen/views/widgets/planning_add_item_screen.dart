import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/controllers/planning_add_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_add_screen/views/widgets/planning_add_next_screen.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class PlanningAddItemScreen extends StatelessWidget {
  const PlanningAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlanningAddScreenController());
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
                    "Add Item",
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

              // Tanggal
              Text(
                "Tanggal",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),

              // Keterangan
              Text(
                "Keterangan",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan keterangan..",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),

              // Nilai Bruto
              Text(
                "Nilai Bruto",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan nilai bruto..",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),

              // Nilai Pajak
              Text(
                "Nilai Pajak",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan nilai pajak..",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),

              // Nilai Netto
              Text(
                "Nilai netto",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan nilai netto..",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(14),

              // Kategori
              Text(
                "Kategori",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicBlackColor,
                  ),
                ),
              ),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan kategori..",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              verticalSpace(40),

              //Button Add Item
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () =>
                      Get.offAll(() => const PlanningAddNextScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HumiColors.humicPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
                            color: HumiColors.humicWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
