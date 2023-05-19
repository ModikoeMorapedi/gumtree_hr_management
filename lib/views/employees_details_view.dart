import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/models/employee_model.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';
import 'package:gumtree_hr_management/utils/strings_util.dart';
import 'package:gumtree_hr_management/widgets/employee_frame_widget.dart';

class EmployeeDetailsView extends StatelessWidget {
  const EmployeeDetailsView({super.key, this.data});
  final Data? data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.green[100],
          body: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: StringUtil.goodDay,
                    style: gumtreeFontSize34Green,
                    children: <TextSpan>[
                      TextSpan(
                          text: data!.employeeName!,
                          style: gumtreeFontSize28Green),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                EmployeeFrameWidget(
                  name: "${StringUtil.name}: ${data!.employeeName}",
                  salary:
                      "${StringUtil.salary}: R ${data!.employeeSalary.toString()}",
                  age: "${StringUtil.age}: ${data!.employeeAge.toString()}",
                ),
              ],
            ),
          ),
        ));
  }
}
