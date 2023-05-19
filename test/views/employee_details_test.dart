import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/utils/data_util.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';
import 'package:gumtree_hr_management/views/employees_details_view.dart';

void main() {
  testWidgets('Find title and Widgets of Employee Details View',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: EmployeeDetailsView(
          data: employee,
        ),
      ),
    );

    //find title of the selected employee
    final titleFinder = find.text(StringUtil.goodDay + employee.employeeName!,
        findRichText: true);
    //Verify if the title is correct
    expect(titleFinder, findsOneWidget);

    //Verify if the Employee details view has a SizedBox
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
