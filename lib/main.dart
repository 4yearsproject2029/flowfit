import 'package:flutter/material.dart';

import 'data/local/local_database.dart';
import 'features/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();

  runApp(const FlowFitApp());
}

class FlowFitApp extends StatelessWidget {
  const FlowFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RepLog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
