import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/widgets/export_row_card.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/spaces.dart';

class HumicExportRealizationScreen extends StatefulWidget {
  const HumicExportRealizationScreen({super.key});

  @override
  State<HumicExportRealizationScreen> createState() =>
      _HumicExportRealizationScreenState();
}

class _HumicExportRealizationScreenState
    extends State<HumicExportRealizationScreen> {
  String selectedFileType = "PDF(.pdf)";
  String selectedDateRange = "01 Jan - 31 Jan 2024";
  String selectedCategory = "All Categories";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Select File Type
        HumicExportRowCard(
          icon: const Icon(Icons.picture_as_pdf, size: 32),
          horizontalSizedBox: horizontalSpace(106),
          title: "Select File Type",
          subtitle: selectedFileType,
          onTap: () async {
            // Show File Type Selection Dialog
            final result = await showDialog<String>(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text("Select File Type"),
                children: [
                  SimpleDialogOption(
                    onPressed: () => Navigator.pop(context, "PDF(.pdf)"),
                    child: const Text("PDF (.pdf)"),
                  ),
                  SimpleDialogOption(
                    onPressed: () => Navigator.pop(context, "Excel(.xlsx)"),
                    child: const Text("Excel (.xlsx)"),
                  ),
                ],
              ),
            );

            if (result != null) {
              setState(() {
                selectedFileType = result;
              });
            }
          },
        ),
        verticalSpace(12),

        // Select Date Range
        HumicExportRowCard(
          icon: const Icon(Icons.date_range, size: 32),
          horizontalSizedBox: horizontalSpace(60),
          title: "Select Date Range",
          subtitle: selectedDateRange,
          onTap: () async {
            // Simulasi memilih rentang tanggal
            // Anda bisa mengganti dengan date picker
            setState(() {
              selectedDateRange = "03 Jan - 03 Feb 2024";
            });
          },
        ),
        verticalSpace(12),

        // Select Category
        HumicExportRowCard(
          icon: const Icon(Icons.category, size: 32),
          horizontalSizedBox: horizontalSpace(60),
          title: "Select Category",
          subtitle: selectedCategory,
          onTap: () async {
            // Simulasi memilih kategori
            setState(() {
              selectedCategory = "Category 1";
            });
          },
        ),
        verticalSpace(288),

        // Download Button
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () async {
              // Handle download with selected parameters
              await ApprovalServices().downloadFile(
                url: "/export",
                fileType: selectedFileType.contains("PDF") ? "pdf" : "excel",
                startDate: "2024-01-01", // Parse from selectedDateRange
                endDate: "2024-12-09", // Parse from selectedDateRange
                context: context,
              );
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: HumiColors.humicPrimaryColor),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download, color: Colors.white),
                SizedBox(width: 12),
                Text(
                  "Download",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
