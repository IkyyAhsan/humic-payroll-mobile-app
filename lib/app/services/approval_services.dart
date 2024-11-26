// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/data/models/compare.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income_expense.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/expense.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/income.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning_compare.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ApprovalServices {
  String? _message;
  String? get message => _message;

  Future<Approve?> getApproveData() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning-approve');
      print(response.data);
      if (response.statusCode == 200) {
        return Approve.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error : $e");
      return null;
    }
  }

  Future<bool> updatePlanningStatusById(
      {required int id, required String status}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio
          .post('/planning/update-status/$id', data: {"status": status});
      if (response.statusCode == 200) {
        return true;
      }
      print(response.data);

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> downloadFile({
    required String url,
    required String fileType, // 'pdf' or 'excel'
    required String startDate,
    required String endDate,
    required BuildContext context,
  }) async {
    try {
      // Meminta izin penyimpanan
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Storage permission denied.',
              style: TextStyle(
                color: HumiColors.humicWhiteColor,
              ),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Persiapkan nama file dan parameter API
      final fileName = fileType == 'pdf' ? 'export.pdf' : 'export.xlsx';
      final queryParams = {
        'type': fileType,
        'startDate': startDate,
        'endDate': endDate,
        "category": "internal"
      };
      print(queryParams['category']);

      // Tentukan lokasi penyimpanan di direktori unduhan
      Directory? externalDir;
      if (Platform.isAndroid) {
        externalDir = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        externalDir = await getDownloadsDirectory();
      }

      if (externalDir == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to access download directory.',
              style: TextStyle(
                color: HumiColors.humicWhiteColor,
              ),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      final savePath = '${externalDir.path}/$fileName';

      // Lakukan request GET untuk mengunduh file
      final response = await dio.download(
        url,
        savePath,
        queryParameters: queryParams,
        onReceiveProgress: (count, total) {
          // Menampilkan progress unduhan (opsional)
          print("Progress: ${((count / total) * 100).toStringAsFixed(0)}%");
        },
      );
      print("Data approval: ${response.data}");

      if (response.statusCode == 200) {
        // Menampilkan notifikasi sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$fileName downloaded to $savePath'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        throw Exception('Failed to download file');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
            style: const TextStyle(
              color: HumiColors.humicWhiteColor,
            ),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<Compare?> getCompareData() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning-compare');
      print(response.data);
      if (response.statusCode == 200) {
        return Compare.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error : $e");
      return null;
    }
  }

  Future<PlanningCompare?> getCompareDetail({int? id}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.get('/planning-compare/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return PlanningCompare.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      print("error : $e");
      return null;
    }
  }

  Future<IncomeExpense?> getExpenseData({int? index}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      // Permintaan GET ke API expense dengan query parameters
      final response =
          await dio.get('/expense', queryParameters: {"page": index});

      if (response.statusCode == 200) {
        // Jika berhasil, parsing JSON menjadi IncomeExpense
        return IncomeExpense.fromJson(response.data);
      } else {
        _message = "Failed to load expenses: ${response.statusCode}";
        return null;
      }
    } catch (e) {
      _message = "Error: $e";
      return null;
    }
  }

  Future<bool> postExpenseData(Expense expense) async {
    try {
      Map<String, dynamic> data = {
        "activity_name": expense.name,
        "transaction_type": expense.transactionType,
        "date": expense.date.toIso8601String(),
        "amount": expense.amount,
        "tax_amount": expense.taxAmount,
        'document_evidence': await MultipartFile.fromFile(
            expense.documentEvidence?.path ?? "",
            filename: 'document evidence ${expense.name}'),
        'image_evidence': await MultipartFile.fromFile(
            expense.imageEvidence?.path ?? "",
            filename: 'image evidence ${expense.name}'),
      };
      var formData = FormData.fromMap(data);
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.post('/finance', data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> postIncomeData(Income income) async {
    try {
      Map<String, dynamic> data = {
        "activity_name": income.name,
        "transaction_type": income.transactionType,
        "date": income.date.toIso8601String(),
        "amount": income.amount,
        "tax_amount": income.taxAmount,
        'document_evidence': await MultipartFile.fromFile(
            income.documentEvidence?.path ?? "",
            filename: 'document evidence ${income.name}'),
        'image_evidence': await MultipartFile.fromFile(
            income.imageEvidence?.path ?? "",
            filename: 'image evidence ${income.name}'),
      };
      var formData = FormData.fromMap(data);
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.post('/finance', data: formData);
      print(response.data);
      if (response.statusCode == 201) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
