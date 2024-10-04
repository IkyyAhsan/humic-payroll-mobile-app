import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/income_screen_controller.dart';

class IncomeScreenView extends GetView<IncomeScreenController> {
  const IncomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncomeScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IncomeScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
