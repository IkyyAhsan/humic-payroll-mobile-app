import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/expenses_screen_controller.dart';

class ExpensesScreenView extends GetView<ExpensesScreenController> {
  const ExpensesScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpensesScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ExpensesScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
