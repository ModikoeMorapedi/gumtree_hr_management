import 'dart:convert';

import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/base/base_service.dart';
import 'package:gumtree_hr_management/services/employees/i_employees_service.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

//Implementation the IEmployees service
class EmployeesService extends BaseService implements IEmployeesService {
  @override
  Future<Employee>? getEmployees() async {
    final response = await getAsync(employeesPath);
    return Employee.fromJson(response);
  }
}
