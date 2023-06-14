import 'package:flutter/material.dart';

class EmployeesListViewWidget extends StatelessWidget {
  const EmployeesListViewWidget({super.key, this.itemCount, this.itemBuilder});

  final int? itemCount;
  final IndexedWidgetBuilder? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          key: const Key("EmployeesViewListView"),
          itemCount: itemCount,
          itemBuilder: itemBuilder!),
    );
  }
}
