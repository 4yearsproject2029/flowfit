import 'package:flutter/material.dart';

import 'data/local/local_database.dart';
import 'data/services/storage_service.dart';
import 'features/home/screens/home_screen.dart';
import 'features/onboarding/screens/onboarding_screen.dart';

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
  final StorageService storageService = StorageService();
  late bool hasCompletedOnboarding;

  @override
  void initState() {
    super.initState();
    hasCompletedOnboarding = storageService.hasCompletedOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    if (hasCompletedOnboarding) {
      return const HomeScreen();
    }

    return OnboardingScreen(
      onCompleted: () {
        setState(() {
          hasCompletedOnboarding = true;
        });
      },
    );
  }
}
