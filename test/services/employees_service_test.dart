import 'package:flutter_test/flutter_test.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employees/i_employees_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../views/employees_view_test.dart';
import 'employees_service_test.mocks.dart';

class EmployeesServiceTest extends Mock implements IEmployeesService {}

@GenerateMocks([EmployeesServiceTest])
Future<void> main() async {
  late MockEmployeesServiceTest employeeService;

  setUpAll(() {
    employeeService = MockEmployeesServiceTest();
  });

  group("Employee Service test", () {
    test('test get employees', () async {
      final model = Employee();

      when(employeeService.getEmployees()).thenAnswer((_) async {
        return model;
      });

      final res = await employeeService.getEmployees();

      expect(res, isA<Employee>());
      expect(res, model);
    });

    test('test getEmployees throws Exception', () {
      when(employeeService.getEmployees()).thenAnswer((_) async {
        throw Exception();
      });

      final res = employeeService.getEmployees();

      expect(res, throwsException);
    });
  });
}
