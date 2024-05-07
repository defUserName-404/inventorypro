import 'package:flutter/material.dart';
import 'package:inventorypro/screens/main_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Inventory Pro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF101540)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
