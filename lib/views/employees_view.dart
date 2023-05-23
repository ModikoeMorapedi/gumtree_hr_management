import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/utils/colors_util.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';
import 'package:gumtree_hr_management/view_models/employees_view_model.dart';
import 'package:gumtree_hr_management/widgets/custom_app_bar_widget.dart';
import 'package:gumtree_hr_management/widgets/employees_list_tile_widget.dart';
import 'package:gumtree_hr_management/widgets/error_screen_widget.dart';
import 'package:gumtree_hr_management/widgets/employees_list_view_widget.dart';
import 'package:gumtree_hr_management/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeesViewModel employeesViewModel =
        Provider.of<EmployeesViewModel>(context);
    return Scaffold(
      //Display the Laoding widget while waiting for the employee from the service
      //Else show error screen
      body: employeesViewModel.isLoading == true
          ? const LoadingWidget()
          : employeesViewModel.isError == true
              ? ErrorScreenWidget(
                  message: employeesViewModel.errorMessage,
                )
              : Column(
                  children: [
                    const CustomAppBarWidget(
                      title: StringUtil.gumtreeEmployees,
                    ),
                    EmployeesListViewWidget(
                      itemCount: employeesViewModel.employeesList!.length,
                      itemBuilder: (context, index) => EmployeesListTileWidget(
                        title: employeesViewModel
                            .employeesList![index].employeeName!,
                        subtitle: employeesViewModel
                            .employeesList![index].employeeSalary
                            .toString(),
                        onTap: () async {
                          //Selecting the employee will take you to the employee's details page
                          await employeesViewModel.getEmployeeDetails(
                              employeesViewModel.employeesList![index].id!);
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
