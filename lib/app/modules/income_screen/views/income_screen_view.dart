import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/income_screen_controller.dart';

class IncomeScreenView extends GetView<IncomeScreenController> {
  const IncomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncomeScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IncomeScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
