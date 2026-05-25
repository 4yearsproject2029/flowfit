import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

void main() {
  runApp(const FlowFitApp());
}

class FlowFitApp extends StatelessWidget {
  const FlowFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
