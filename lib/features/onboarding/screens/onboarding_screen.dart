import 'package:flutter/material.dart';

import '../../../data/services/storage_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    required this.onCompleted,
    this.storageService,
    super.key,
  });

  final VoidCallback onCompleted;
  final StorageService? storageService;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final StorageService storageService =
      widget.storageService ?? StorageService();

  int selectedWeeklyGoal = 3;
  bool isSaving = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              children: [
                Text(
                  'Set your weekly goal',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Choose a realistic target. RepLog is here to help you show up consistently, not chase perfection.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Saved only on this device. No account or network connection required. Uninstalling RepLog or switching devices may result in data loss.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                Text(
                  'Workouts per week',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                for (final goal in const [1, 2, 3, 4, 5]) ...[
                  _WeeklyGoalOption(
                    goal: goal,
                    isSelected: selectedWeeklyGoal == goal,
                    onSelected: isSaving
                        ? null
                        : () {
                            setState(() {
                              selectedWeeklyGoal = goal;
                              errorMessage = null;
                            });
                          },
                  ),
                  const SizedBox(height: 8),
                ],
                if (errorMessage != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: isSaving ? null : _saveGoal,
                    child: Text(isSaving ? 'Saving...' : 'Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveGoal() async {
    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    var didSaveGoal = false;

    try {
      await storageService.saveWeeklyGoal(selectedWeeklyGoal);
      didSaveGoal = true;
    } catch (_) {
      if (mounted) {
        setState(() {
          errorMessage = "We couldn't save your goal. Please try again.";
          isSaving = false;
        });
      }
    }

    if (didSaveGoal) {
      widget.onCompleted();
    }
  }
}

class _WeeklyGoalOption extends StatelessWidget {
  const _WeeklyGoalOption({
    required this.goal,
    required this.isSelected,
    required this.onSelected,
  });

  final int goal;
  final bool isSelected;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final label = goal == 1 ? '1 workout per week' : '$goal workouts per week';

    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: InkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primaryContainer
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? colorScheme.primary : colorScheme.outline,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.circle_outlined,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
