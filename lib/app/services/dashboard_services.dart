import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/shared/constant.dart';

class DashboardServices {
  String? _message;
  String? get message => _message;
   Future<Dashboard?> getDashboardData() async{
    try{
      final response = await dio.get('/dashboard');
      if(response.statusCode == 200) {
        return Dashboard.fromJson(response.data);
      }
      return null;
    }catch(e) {
      _message = "$e";

      return null;
    }

   }
}