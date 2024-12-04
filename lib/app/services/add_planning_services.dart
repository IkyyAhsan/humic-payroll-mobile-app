import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/add_item.dart';
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

      FormData formData = FormData.fromMap({
        "planning_id": item.planningId,
        "date": item.date.toIso8601String(),
        "information": item.information,
        "bruto_amount": item.brutoAmount,
        "tax_amount": item.taxAmount,
        "netto_amount": item.nettoAmount,
        "category": item.category,
        "document_evidence": item.documentEvidence != null
            ? await MultipartFile.fromFile(
                item.documentEvidence?.path ?? "",
                filename: "file.pdf",
              )
            : null,
        "image_evidence": item.imageEvidence != null
            ? await MultipartFile.fromFile(
                item.imageEvidence?.path ?? "",
                filename: "file.png",
              )
            : null,
        "isAddition": item.isAddition,
      });

      final response = await dio.post(
        '/item',
        data: formData,
      );
      print(response.data);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print("Err $e");
      _message = "Error $e";
      print(e);
      return false;
    }
  }

  Future<bool> editItemPlanning(
      {required AddItem item, required int id}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      FormData formData = FormData.fromMap({
        "planning_id": item.planningId,
        "date": item.date.toIso8601String(),
        "information": item.information,
        "bruto_amount": item.brutoAmount,
        "tax_amount": item.taxAmount,
        "netto_amount": item.nettoAmount,
        "category": item.category,
        "isAddition": item.isAddition,
        "document_evidence": item.documentEvidence != null
            ? await MultipartFile.fromFile(
                item.documentEvidence?.path ?? "",
                filename: "file.pdf",
              )
            : null,
        "image_evidence": item.imageEvidence != null
            ? await MultipartFile.fromFile(
                item.imageEvidence?.path ?? "",
                filename: "file.png",
              )
            : null,
      });

      final response = await dio.post(
        '/item/$id',
        data: formData,
      );
      print(response.data);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print("Error $e");
      _message = "Error $e";
      print(e);
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
