import 'package:flutter/foundation.dart';
import 'package:gumtree_hr_management/services/employees/employees_service.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/navigation_service.dart';
import 'package:gumtree_hr_management/utils/routes.dart';
import 'package:gumtree_hr_management/utils/service_locator.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';

import '../services/employee/employee_details_service.dart';

class EmployeesViewModel extends ChangeNotifier {
  EmployeesViewModel() : super() {
    getEmployees();
  }

  final NavigationService _navigationService = locator<NavigationService>();
  final EmployeesService _employeesService = EmployeesService();
  final EmployeeDetailsService _employeeDetailsService =
      EmployeeDetailsService();

  List<Data>? _employeesList;
  bool? _isLoading = false;
  Data? _employeeDetails;
  String? _errorMessage;
  bool? _isError = false;

  List<Data>? get employeesList => _employeesList;
  Data? get employeeDetails => _employeeDetails;
  bool? get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool? get isError => _isError;

  setIsLoading(bool? isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  getEmployees() async {
    try {
      setIsLoading(true);
      final employeesResponse = await _employeesService.getEmployees();
      if (employeesResponse != null) {
        _employeesList = employeesResponse.data;
        setIsLoading(false);
        notifyListeners();
      } else {
        _isError = true;
        _errorMessage = StringUtil.pleaseTryAgain;
      }
    } catch (e) {
      _isError = true;
      _errorMessage = e.toString();
      setIsLoading(false);
    }
  }

  getEmployeeDetails(int id) async {
    try {
      setIsLoading(true);
      final employeeDetailsResponse =
          await _employeeDetailsService.getEmployeeDetails(id.toString());
      if (employeeDetailsResponse != null) {
        _employeeDetails = employeeDetailsResponse;
        _navigationService.navigateToArgs(Routes.employeeDetailsView,
            arguments: _employeeDetails!);
        setIsLoading(false);
        notifyListeners();
      } else {
        _isError = true;
        _errorMessage = StringUtil.pleaseTryAgain;
      }
    } catch (e) {
      _isError = true;
      _errorMessage = e.toString();
      setIsLoading(false);
    }
  }
}