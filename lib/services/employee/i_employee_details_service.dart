import 'package:gumtree_hr_management/models/employee_model.dart';

abstract class IEmployeeDetailsService {
  Future<Data>? getEmployeeDetails(String id);
}
