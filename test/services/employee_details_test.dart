import 'package:flutter_test/flutter_test.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employee/i_employee_details_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'employee_details_test.mocks.dart';

class EmployeesDetailsServiceTest extends Mock
    implements IEmployeeDetailsService {}

@GenerateMocks([EmployeesDetailsServiceTest])
Future<void> main() async {
  late MockEmployeesDetailsServiceTest employeeService;

  setUpAll(() {
    employeeService = MockEmployeesDetailsServiceTest();
  });

  group("Employee Service test", () {
    test('test get employee details', () async {
      final model = Data();

      when(employeeService.getEmployeeDetails("1")).thenAnswer((_) async {
        return model;
      });

      final res = await employeeService.getEmployeeDetails("1");

      expect(res, isA<Data>());
      expect(res, model);
    });

    test('test get employee details throws Exception', () {
      when(employeeService.getEmployeeDetails("1")).thenAnswer((_) async {
        throw Exception();
      });

      final res = employeeService.getEmployeeDetails("1");
      expect(res, throwsException);
    });
  });
}
