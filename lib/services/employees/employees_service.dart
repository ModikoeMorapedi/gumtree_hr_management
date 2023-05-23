import 'dart:convert';

import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employees/i_employees_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

//Implementation the IEmployees service
class EmployeesService extends IEmployeesService {
  @override
  Future<Employee>? getEmployees() async {
    try {
      //Get the employees
      final response = await http.get(Uri.https(baseUrl, employeesPath));
      //Check if the response is 200
      if (response.statusCode == 200) {
        //Decode and Map the employee's details
        return Employee.fromJson(jsonDecode(response.body));
      } else {
        return jsonDecode(response.statusCode.toString());
      }
    } catch (err) {
      throw Exception();
    }
  }
}
