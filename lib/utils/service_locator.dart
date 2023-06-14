import 'package:get_it/get_it.dart';
import 'package:gumtree_hr_management/services/employee/i_employee_details_service.dart';
import 'package:gumtree_hr_management/services/employees/employees_service.dart';
import 'package:gumtree_hr_management/services/employees/i_employees_service.dart';
import 'package:gumtree_hr_management/services/navigation/navigation_service.dart';

import '../services/employee/employee_details_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerFactory<IEmployeesService>(() => EmployeesService(),
      instanceName: "employeesService");
  locator
      .registerFactory<IEmployeeDetailsService>(() => EmployeeDetailsService());
  //View Models
}
