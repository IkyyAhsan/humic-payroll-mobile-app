import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/widgets/export_row_card.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:intl/intl.dart';

class HumicExportTransactionScreen extends StatefulWidget {
  const HumicExportTransactionScreen({
    super.key,
  });

  @override
  State<HumicExportTransactionScreen> createState() =>
      _HumicExportTransactionScreenState();
}

class _HumicExportTransactionScreenState
    extends State<HumicExportTransactionScreen> {
  String selectedFileType = "PDF(.pdf)";
  String selectedDateRange = "03 Okt - 03 Okt 2024";

  DateTime? startDate; // Menyimpan tanggal awal
  DateTime? endDate; // Menyimpan tanggal akhir

  final List<String> fileTypes = ["PDF(.pdf)", "Excel(.xlsx)"];

  // Fungsi untuk format tanggal
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  // Fungsi untuk format rentang tanggal
  String formatDateRange(DateTime startDate, DateTime endDate) {
    return "${DateFormat('dd MMM').format(startDate)} - ${DateFormat('dd MMM yyyy').format(endDate)}";
  }

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
            final result = await showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Select File Type"),
                content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedFileType,
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        items: fileTypes.map((String fileType) {
                          return DropdownMenuItem<String>(
                            value: fileType,
                            child: Text(
                              fileType,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: HumiColors.humicBlackColor,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedFileType = newValue;
                            });
                            Navigator.pop(context, newValue);
                          }
                        },
                      ),
                    );
                  },
                ),
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
            DateTime? selectedStartDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              helpText: 'Start Date',
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: HumiColors.humicPrimaryColor,
                      onPrimary: HumiColors.humicWhiteColor,
                      onSurface: HumiColors.humicBlackColor,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (selectedStartDate != null) {
              DateTime? selectedEndDate = await showDatePicker(
                context: context,
                initialDate: selectedStartDate.add(const Duration(days: 1)),
                firstDate: selectedStartDate,
                lastDate: DateTime(2101),
                helpText: 'End Date',
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: HumiColors.humicPrimaryColor,
                        onPrimary: HumiColors.humicWhiteColor,
                        onSurface: HumiColors.humicBlackColor,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: HumiColors.humicPrimaryColor,
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (selectedEndDate != null) {
                setState(() {
                  startDate = selectedStartDate;
                  endDate = selectedEndDate;
                  selectedDateRange =
                      formatDateRange(selectedStartDate, selectedEndDate);
                });
              }
            }
          },
        ),

        verticalSpace(60),

        // Download Button
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () async {
              if (startDate != null && endDate != null) {
                final fileType =
                    selectedFileType.contains("PDF") ? "pdf" : "excel";

                // Panggil ApprovalServices untuk mendownload file
                await ApprovalServices().downloadFile(
                  url: "/export",
                  fileType: fileType,
                  startDate: formatDate(startDate!),
                  endDate: formatDate(endDate!),
                  context: context,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select a date range")),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: HumiColors.humicPrimaryColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download, color: HumiColors.humicWhiteColor),
                SizedBox(width: 12),
                Text(
                  "Download",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicWhiteColor,
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
