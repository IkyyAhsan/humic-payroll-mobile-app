import 'package:flutter/material.dart';
import 'package:humic_payroll_mobile_app/app/modules/profile_screen/views/widgets/curved_edge.dart';

class HumicCurvedEdgeWidget extends StatelessWidget {
  const HumicCurvedEdgeWidget({
    super.key, 
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HumiCustomCurvedEdges(),
      child: child
    );
  }
}