import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';

class EmployeesListTileWidget extends StatelessWidget {
  const EmployeesListTileWidget(
      {super.key, this.title, this.subtitle, this.onTap});
  final String? title;
  final String? subtitle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        trailing: const Icon(Icons.more_vert),
        title: Text(
          title!,
          style: gumtreeFontSize16Green,
        ),
        subtitle: Text(
          subtitle!,
          style: gumtreeFontSize16Green,
        ),
        onTap: onTap,
      ),
    );
  }
}
