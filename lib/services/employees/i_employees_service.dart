import 'package:gumtree_hr_management/models/employee_model.dart';

abstract class IEmployeesService {
  Future<Employee>? getEmployees();
}
