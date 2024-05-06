import 'package:flutter/material.dart';

class VerticalAppBar extends StatefulWidget {
  const VerticalAppBar({super.key});

  @override
  State<VerticalAppBar> createState() => _VerticalAppBarState();
}

class _VerticalAppBarState extends State<VerticalAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      groupAlignment: -1,
      backgroundColor: Theme.of(context).primaryColor,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Text('Dashboard'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.computer_outlined),
          selectedIcon: Icon(Icons.computer),
          label: Text('Items'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle),
          label: Text('Users'),
        ),
      ],
      useIndicator: true,
      indicatorShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      selectedIconTheme: Theme.of(context).iconTheme.copyWith(size: 32),
      unselectedIconTheme:
          Theme.of(context).iconTheme.copyWith(color: Colors.white, size: 32),
      unselectedLabelTextStyle: const TextStyle(color: Colors.white),
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
    );
  }
}
