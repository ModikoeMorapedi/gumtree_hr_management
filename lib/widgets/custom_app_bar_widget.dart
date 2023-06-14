import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gumtree_hr_management/utils/colors_util.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtil.greenColor,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 5,
      child: Text(
        title!,
        style: gumtreeFontSize26Black,
      ),
    );
  }
}
