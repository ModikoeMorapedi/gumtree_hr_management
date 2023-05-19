import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/services/navigation_service.dart';
import 'package:gumtree_hr_management/utils/routes_util.dart';
import 'package:gumtree_hr_management/utils/service_locator.dart';
import 'package:gumtree_hr_management/view_models/employees_view_model.dart';
import 'package:provider/provider.dart';

import 'views/employees_view.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EmployeesViewModel>(
              create: (_) => EmployeesViewModel()),
        ],
        child: MaterialApp(
          title: 'Gumtree HR Management',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const EmployeesView(),
          onGenerateRoute: RoutesUtils.generateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          debugShowCheckedModeBanner: false,
        ));
  }
}
