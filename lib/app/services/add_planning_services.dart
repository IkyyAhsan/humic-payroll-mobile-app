import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning.dart';
import '../data/models/planning.dart';
import '../shared/constant.dart';

class AddItemServices {
  String? _message;
  String? get message => _message;

  Future<Planning?> getAddItem() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      // Permintaan GET ke API user profile
      final response = await dio.get('/planning');

      if (response.statusCode == 200) {
        // Jika berhasil, parsing JSON menjadi UserProfile
        return Planning.fromJson(response.data);
      } else {
        _message = "Failed to load profile: ${response.statusCode}";
        return null;
      }
    } catch (e) {
      _message = "Error: $e";
      return null;
    }
  }

  Future<bool> addItemPlanning({required AddItem item}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Map<String, dynamic> data = {
        "planning_id": item.planningId,
        "date": item.date.toIso8601String(),
        "information": item.information,
        "bruto_amount": item.brutoAmount,
        "tax_amount": item.taxAmount,
        "netto_amount": item.nettoAmount,
        "category": item.category,
        "isAddition": item.isAddition,
      };
      final response = await dio.post(
        '/item',
        data: data,
      );
      print(response.data);
      print(item.planningId);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      _message = "Error $e";
      print(e);
      return false;
    }
  }
}
