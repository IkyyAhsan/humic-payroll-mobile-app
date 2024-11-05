import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_details_screen/views/widgets/compare_detail_report_card.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicPlanningCompareScreen extends StatelessWidget {
  const HumicPlanningCompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card for Compare Planning Item
        const HumicDetailCompareReport(
          eventName: 'Conference ICYCYTA',
          startDate: '15 Okt 2024',
          endDate: '21 Okt 2024',
          eventDate: '21/10/2024',
          eventDescription: 'Ini adalah Keterangan dari Item 1',
          brutoValue: 'Rp200.000.000',
          taxValue: 'Rp20.000.000',
          nettoValue: 'Rp20.000.000',
          category: 'Internal',
        ),
        verticalSpace(12),
      ],
    );
  }
}
