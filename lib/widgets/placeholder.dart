import 'package:flutter/material.dart';
import 'package:inventorypro/widgets/dashboard.dart';
import 'package:inventorypro/widgets/items.dart';
import 'package:inventorypro/widgets/users.dart';

class ContentPlaceholder extends StatelessWidget {
  final int selectedIndex;

  const ContentPlaceholder({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const DashboardContent();
      case 1:
        return const ItemContent();
      case 2:
        return const UserContent();
      default:
        return Container();
    }
  }
}
