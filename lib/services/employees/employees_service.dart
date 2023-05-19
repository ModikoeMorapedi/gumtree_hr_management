import 'dart:convert';

import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employees/i_employees_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

class EmployeesService extends IEmployeesService {
  @override
  Future<Employee>? getEmployees() async {
    try {
      final response = await http.get(Uri.https(baseUrl, employeesPath));

      if (response.statusCode == 200) {
        return Employee.fromJson(jsonDecode(response.body));
      } else {
        return jsonDecode(response.statusCode.toString());
      }
    } catch (err) {
      throw Exception();
    }
  }
}
