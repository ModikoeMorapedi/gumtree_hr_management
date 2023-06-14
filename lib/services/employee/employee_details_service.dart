import 'dart:convert';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/base/base_service.dart';
import 'package:gumtree_hr_management/services/employee/i_employee_details_service.dart';
import '../../utils/constants.dart';

//Implementing the IEmployeeDetailsService
class EmployeeDetailsService extends BaseService
    implements IEmployeeDetailsService {
  @override
  Future<Data>? getEmployeeDetails(String id) async {
    final response = await getAsync(employeePath + id);
    return Data.fromJson(response);
  }
}
