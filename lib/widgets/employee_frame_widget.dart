import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gumtree_hr_management/utils/colors_util.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';

class EmployeeFrameWidget extends StatelessWidget {
  const EmployeeFrameWidget({super.key, this.name, this.salary, this.age});
  final String? name;
  final String? salary;
  final String? age;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10, top: 10),
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: 5.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
        color: ColorsUtil.greenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name!, style: gumtreeFontSize20Black),
          Text(salary!, style: gumtreeFontSize20Black),
          Text(age!, style: gumtreeFontSize20Black),
        ],
      ),
    );
  }
}
