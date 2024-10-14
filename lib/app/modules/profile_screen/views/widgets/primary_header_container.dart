import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/widgets/curved_edge_widget.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';

class HUMICPrimaryHeaderContainer extends StatelessWidget {
  const HUMICPrimaryHeaderContainer({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HumicCurvedEdgeWidget(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 247,
            padding: const EdgeInsets.all(0),
            child: const Image(image: AssetImage(HumicImages.humicProfileBackgroundImage)),
          ),
          child,
        ],
      ),
    );
  }
}