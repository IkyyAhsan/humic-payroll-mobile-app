import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/widgets/export_row_card.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class HumicExportRealizationScreen extends StatelessWidget {
  const HumicExportRealizationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Select File Type
        HumicExportRowCard(
          icon: const Icon(FluentIcons.document_24_regular, size: 32),
          horizontalSizedBox: horizontalSpace(106),
          title: "Select File Type",
          subtitle: "PDF(.pdf)",
          onTap: () {}, // Tambahkan fungsi untuk pilih file
        ),
        verticalSpace(12),

        // Select Date Range
        HumicExportRowCard(
          icon: const Iconify(Mdi.calendar_blank, size: 32),
          horizontalSizedBox: horizontalSpace(60),
          title: "Select Date Range",
          subtitle: "03 Okt - 03 Nov 2024",
          onTap: () {}, // Tambahkan fungsi untuk pilih tanggal
        ),
        verticalSpace(12),

        // Select Category
        HumicExportRowCard(
          icon: const Iconify(MaterialSymbols.category_outline, size: 32),
          horizontalSizedBox: horizontalSpace(60),
          title: "Select Category",
          subtitle: "03 Okt - 03 Nov 2024",
          onTap: () {}, // Tambahkan fungsi untuk pilih kategori
        ),
        verticalSpace(288),

        // Download Button
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: HumiColors.humicPrimaryColor),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify(
                  MaterialSymbols.download,
                  size: 24,
                  color: HumiColors.humicWhiteColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Download",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HumiColors.humicWhiteColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
