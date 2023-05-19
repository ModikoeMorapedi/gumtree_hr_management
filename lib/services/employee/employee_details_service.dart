import 'dart:convert';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employee/i_employee_details_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsService extends IEmployeeDetailsService {
  @override
  Future<Data>? getEmployeeDetails(String id) async {
    try {
      final response = await http.get(Uri.https(baseUrl, employeePath + id));
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(response.body)["data"]);
      } else {
        return jsonDecode(response.statusCode.toString());
      }
    } catch (err) {
      throw Exception();
    }
  }
}
