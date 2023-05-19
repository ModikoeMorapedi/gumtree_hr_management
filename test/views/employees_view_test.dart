import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/services/employees/employees_service.dart';
import 'package:gumtree_hr_management/utils/data_util.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';
import 'package:gumtree_hr_management/views/employees_details_view.dart';
import 'package:gumtree_hr_management/widgets/custom_app_bar_widget.dart';
import 'package:gumtree_hr_management/widgets/employees_list_tile_widget.dart';
import 'package:gumtree_hr_management/widgets/employees_list_view_widget.dart';
import 'package:mockito/mockito.dart';

void main() {
  testWidgets('Test selected item', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmployeesListViewWidget(
            itemCount: employees.data!.length,
            itemBuilder: (context, index) => EmployeesListTileWidget(
              title: employees.data![index].employeeName,
              subtitle: employees.data![index].employeeSalary.toString(),
            ),
          ),
        ),
      ),
    );

    // Selecting the third item
    final itemToTap = employees.data![2].employeeName!;

    // Tap on the ListTile of the selected item
    await tester.tap(find.widgetWithText(ListTile, itemToTap));

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Verify selected item
    expect(find.text('Ashton Cox'), findsOneWidget);
  });
}
