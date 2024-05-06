import 'package:flutter/material.dart';
import 'package:inventorypro/widgets/placeholder.dart';
import 'package:inventorypro/widgets/vertical_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
      body: const Row(
        children: [VerticalAppBar(), Expanded(child: ContentPlaceholder())],
      ),
    );
  }
}
