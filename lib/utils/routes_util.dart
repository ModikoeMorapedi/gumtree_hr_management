import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/utils/routes.dart';
import 'package:gumtree_hr_management/views/employees_details_view.dart';
import 'package:gumtree_hr_management/views/employees_view.dart';
import 'package:gumtree_hr_management/widgets/error_screen_widget.dart';

import '../models/employee_model.dart';

class RoutesUtils {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.employeesView:
        return MaterialPageRoute(builder: (_) => const EmployeesView());
      case Routes.errorScreenWidget:
        String? message = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ErrorScreenWidget(
                  message: message,
                ));
      case Routes.employeeDetailsView:
        Data? data = settings.arguments as Data;
        return MaterialPageRoute(
            builder: (_) => EmployeeDetailsView(
                  data: data,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedView());
    }
  }
}

class UndefinedView extends StatelessWidget {
  const UndefinedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Something went wrong '),
      ),
    );
  }
}
