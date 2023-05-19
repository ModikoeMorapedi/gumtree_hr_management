import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmployeesListViewWidget extends StatelessWidget {
  const EmployeesListViewWidget({super.key, this.itemCount, this.itemBuilder});

  final int? itemCount;
  final IndexedWidgetBuilder? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      padding: const EdgeInsets.all(30),
      child: ListView.builder(
          key: const Key("EmployeesViewListView"),
          itemCount: itemCount,
          itemBuilder: itemBuilder!),
    );
  }
}
