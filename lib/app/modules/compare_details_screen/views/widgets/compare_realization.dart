import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/views/widgets/compare_detail_report_card.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/date_format.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../../../../data/models/planning_compare.dart';

class HumicRealizationCompareScreen extends StatelessWidget {
  final Planning? planning;
  const HumicRealizationCompareScreen({super.key, required this.planning});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card for Compare Transaction Item
        HumicDetailCompareReport(
          eventName: planning?.title ?? '',
          startDate: formatDate(planning?.startDate ?? ''),
          endDate: formatDate(planning?.endDate ?? ''),
          data: planning?.item ?? [],
          // eventDate: '21/10/2024',
          // eventDescription: 'Ini adalah Keterangan dari Item 1',
          // brutoValue: 'Rp400.000.000',
          // taxValue: 'Rp40.000.000',
          // nettoValue: 'Rp40.000.000',
          // category: 'Internal',
        ),
        verticalSpace(12),
      ],
    );
  }
}
