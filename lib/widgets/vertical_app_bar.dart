import 'dart:developer';

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
    final colorTheme = Theme.of(context).colorScheme;
    return NavigationRail(
        selectedIndex: _selectedIndex,
        groupAlignment: -1,
        backgroundColor: colorTheme.onSurface,
        onDestinationSelected: (int index) {
          setState(() => _selectedIndex = index);
          log('index $index');
        },
        labelType: NavigationRailLabelType.none,
        destinations: [
          CustomNavigationRailDestination(
            icon: Icons.dashboard_outlined,
            selectedIcon: Icons.dashboard,
            label: 'Dashboard',
            isSelected: _selectedIndex == 0,
            highlightColor: colorTheme.onPrimary,
          ),
          CustomNavigationRailDestination(
            icon: Icons.computer_outlined,
            selectedIcon: Icons.computer,
            label: 'Items',
            isSelected: _selectedIndex == 1,
            highlightColor: colorTheme.onPrimary,
          ),
          CustomNavigationRailDestination(
            icon: Icons.account_circle_outlined,
            selectedIcon: Icons.account_circle,
            label: 'Users',
            isSelected: _selectedIndex == 2,
            highlightColor: colorTheme.onPrimary,
          ),
          CustomNavigationRailDestination(
            icon: Icons.account_circle_outlined,
            selectedIcon: Icons.account_circle,
            label: 'Report Statistics',
            isSelected: _selectedIndex == 3,
            highlightColor: colorTheme.onPrimary,
          ),
        ],
        useIndicator: false,
        selectedIconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: colorTheme.surface, size: 48),
        unselectedIconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: colorTheme.surfaceVariant, size: 48));
  }
}

class CustomNavigationRailDestination extends NavigationRailDestination {
  CustomNavigationRailDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required Color highlightColor,
    required bool isSelected,
  }) : super(
          icon: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.5)
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                Icon(selectedIcon, color: Colors.white),
                Text(label, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          selectedIcon: Container(
            width: 200,
            decoration: BoxDecoration(
              color: isSelected
                  ? highlightColor.withOpacity(0.3)
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                Icon(selectedIcon),
                Text(label, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          label: Text(label),
        );
}
