import 'package:flutter/material.dart';

import 'data/local/local_database.dart';
import 'data/services/storage_service.dart';
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
      home: const AppEntry(),
    );
  }
}

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  static const int _defaultWeeklyGoal = 3;

  final StorageService storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _saveDefaultWeeklyGoalIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }

  Future<void> _saveDefaultWeeklyGoalIfNeeded() async {
    if (storageService.getWeeklyGoal() != null) {
      return;
    }

    await storageService.saveWeeklyGoal(_defaultWeeklyGoal);
    if (!mounted) {
      return;
    }

    setState(() {});
  }
}
