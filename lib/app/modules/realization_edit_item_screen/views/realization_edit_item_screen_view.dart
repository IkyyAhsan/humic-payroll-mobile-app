import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/realization_edit_item_screen_controller.dart';

class RealizationEditItemScreenView
    extends GetView<RealizationEditItemScreenController> {
  const RealizationEditItemScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(RealizationEditItemScreenController());
    return Scaffold(
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
                      "Edit Item",
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
                verticalSpace(32),
                const Divider(
                  color: HumiColors.humicTransparencyColor,
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
                    readOnly: true,
                    controller: controller.endDate,
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: controller.changeDate,
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
                    controller: controller.keteranganItem,
                    decoration: InputDecoration(
                      hintText: "Masukkan keterangan..",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor,
                      ),
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
                    controller: controller.nilaiBrutoItem,
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
                    controller: controller.nilaiPajakItem,
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
                    controller: controller.nilaiNettoItem,
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
                  child: DropdownButtonFormField<String>(
                    value: controller.kategoriItem.text.isEmpty
                        ? null
                        : controller.kategoriItem.text,
                    items: [
                      DropdownMenuItem(
                        value: "internal",
                        child: Text(
                          "Internal",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicBlackColor,
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "eksternal",
                        child: Text(
                          "Eksternal",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicBlackColor,
                            ),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "rka",
                        child: Text(
                          "rka",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HumiColors.humicBlackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: "Pilih kategori..",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: HumiColors.humicTransparencyColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      controller.kategoriItem.text = value ?? "";
                    },
                  ),
                ),
                verticalSpace(14),

                // Document Evidence
                Text(
                  "Document Evidence",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HumiColors.humicBlackColor,
                    ),
                  ),
                ),
                verticalSpace(12),

                // Document Evidence
                GestureDetector(
                  onTap: controller.addUploadDocumentEvidence,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: HumiColors.humicBlackColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: controller.documentEvidence != null
                        ? controller.documentEvidence!.path.endsWith('.pdf')
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Uploaded: ${controller.documentEvidence!.path.split('/').last}", // Format nama file
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: HumiColors.humicBlackColor,
                                      ),
                                    ),
                                    textAlign:
                                        TextAlign.center, // Teks di tengah
                                  ),
                                  SizedBox(
                                      height:
                                          8), // Spasi antara nama file dan teks tambahan
                                  Text(
                                    "File was uploaded", // Teks tambahan
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: HumiColors
                                            .humicPrimaryColor, // Warna teks tambahan
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Image.file(
                                File(controller.documentEvidence!.path),
                                fit: BoxFit.cover,
                              )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  HumicImages.humicUploadImageIcon,
                                ),
                              ),
                              Text("Upload File Evidence (PDF)"),
                            ],
                          ),
                  ),
                ),

                verticalSpace(14),

                // Image Evidence
                Text(
                  "Image Evidence",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: HumiColors.humicBlackColor)),
                ),
                verticalSpace(12),

                // Image Evidence
                GestureDetector(
                  onTap: controller.addUploadImageEvidence,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: HumiColors.humicBlackColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: controller.imageEvidence != null
                        ? ['png', 'jpg', 'jpeg'].contains(controller
                                .imageEvidence!.path
                                .split('.')
                                .last
                                .toLowerCase())
                            ? Text(
                                "Uploaded :\n\n${Get.arguments['data'].imageEvidence}",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: HumiColors.humicBlackColor,
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Invalid Image Format",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor,
                                  ),
                                ),
                              )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    HumicImages.humicUploadImageIcon),
                              ),
                              Text("Upload Image File (.png/.jpg/.jpeg)"),
                            ],
                          ),
                  ),
                ),

                verticalSpace(40),

                //Button Add Item
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.addItem,
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
                        horizontalSpace(5),
                        Text(
                          'Edit Item',
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
      ),
    );
  }
}
