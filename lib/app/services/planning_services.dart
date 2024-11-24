import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

import '../data/models/input/add_planning.dart';

class PlanningServices {
  String? _message;
  String? get message => _message;

  Future<Planning?> getPlanningData({int? page}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response =
          await dio.get('/planning', queryParameters: {"page": page});
      print(response.data);
      if (response.statusCode == 200) {
        return Planning.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _message = "$e";
      return null;
    }
  }

  Future<PlanningDetail?> postPlanning({required AddPlanning planning}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Map<String, dynamic> data = {
        'title': planning.title,
        'start_date': planning.startDate.toIso8601String(),
        'end_date': planning.endDate.toIso8601String(),
      };
      final resposne = await dio.post('/planning', data: data);
      print(resposne);
      if (resposne.statusCode == 201) {
        return PlanningDetail.fromJson(resposne.data['planning']);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deletePlanning({int? id}) async {
    try {
      var response = await dio.delete('/planning/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteItem(int index) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      final response = await dio.delete(
        '/item/$index',
      );
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
