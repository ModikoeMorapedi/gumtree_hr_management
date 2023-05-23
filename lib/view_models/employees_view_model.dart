import 'package:flutter/foundation.dart';
import 'package:gumtree_hr_management/services/employees/employees_service.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/navigation/navigation_service.dart';
import 'package:gumtree_hr_management/utils/routes.dart';
import 'package:gumtree_hr_management/utils/service_locator.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';

import '../services/employee/employee_details_service.dart';

class EmployeesViewModel extends ChangeNotifier {
  EmployeesViewModel() : super() {
    getEmployees();
  }

  //Initializing the services
  final NavigationService _navigationService = locator<NavigationService>();
  final EmployeesService _employeesService = EmployeesService();
  final EmployeeDetailsService _employeeDetailsService =
      EmployeeDetailsService();

  //Private properties
  List<Data>? _employeesList;
  bool? _isLoading = false;
  Data? _employeeDetails;

  //Getters
  List<Data>? get employeesList => _employeesList;
  Data? get employeeDetails => _employeeDetails;
  bool? get isLoading => _isLoading;

  //Setters
  setIsLoading(bool? isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  getEmployees() async {
    try {
      setIsLoading(true);
      //Call the employees service to get the employees
      final employeesResponse = await _employeesService.getEmployees();
      //Check if the employees reponse is not null
      if (employeesResponse != null) {
        _employeesList = employeesResponse.data;
        //Set the isLoading to false and notifyListeners
        setIsLoading(false);
        notifyListeners();
      } else {
        _navigationService.navigateToArgs(Routes.errorScreenWidget,
            arguments: StringUtil.somethingWentWrong);
      }
    } catch (e) {
      // Navigate to the error screen
      _navigationService.navigateToArgs(Routes.errorScreenWidget,
          arguments: e.toString());
      setIsLoading(false);
    }
  }

  //Get the employee details
  getEmployeeDetails(int id) async {
    try {
      setIsLoading(true);
      //Call the get employee details service using the employee's ID
      final employeeDetailsResponse =
          await _employeeDetailsService.getEmployeeDetails(id.toString());
      // check if the employee response is not null
      if (employeeDetailsResponse != null) {
        _employeeDetails = employeeDetailsResponse;
        _navigationService.navigateToArgs(Routes.employeeDetailsView,
            arguments: _employeeDetails!);
        //Set is loading false
        setIsLoading(false);
        //Notify all the listners
        notifyListeners();
      } else {
        _navigationService.navigateToArgs(Routes.errorScreenWidget,
            arguments: StringUtil.somethingWentWrong);
      }
    } catch (e) {
      // Navigate to the error screen
      _navigationService.navigateToArgs(Routes.errorScreenWidget,
          arguments: e.toString());
      setIsLoading(false);
    }
  }
}
