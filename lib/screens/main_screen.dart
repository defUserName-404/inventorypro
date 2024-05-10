import 'package:flutter/material.dart';
import 'package:inventorypro/widgets/placeholder.dart';
import 'package:inventorypro/widgets/vertical_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Row(
        children: [
          VerticalAppBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onDestinationSelected,
          ),
          Expanded(child: ContentPlaceholder(selectedIndex: _selectedIndex))
        ],
      ),
    );
  }
}
