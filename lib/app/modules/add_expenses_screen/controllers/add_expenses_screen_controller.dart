import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/expense.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

class AddExpensesScreenController extends GetxController {
  DateTime currentDate = DateTime.now();
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController taxAmount = TextEditingController();
  File? uploadFile;
  File? evidence;


  void addUploadFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  File file = File(result.files.single.path!);
  uploadFile = file;
} else {
  // User canceled the picker
}
update();
  }
    void addEvidence() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  File file = File(result.files.single.path!);
  evidence = file;
} else {
  // User canceled the picker
}
update();
  }
  void addExpense() async {
    Expense expense = Expense(name: name.text, date: currentDate, amount: int.parse(amount.text), taxAmount: int.parse(taxAmount.text), documentEvidence: evidence, imageEvidence: uploadFile);
    print(await ApprovalServices().postExpenseData(expense));
  }
}
