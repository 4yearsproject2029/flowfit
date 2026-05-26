import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_category.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../calendar/widgets/weekly_calendar.dart';
import '../../timer/widgets/rest_timer.dart';
import '../../workout/widgets/add_workout_button.dart';
import '../../workout/widgets/workout_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService storageService = StorageService();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlowFit'), centerTitle: false),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This Week',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    WeeklyCalendar(
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _RestTimerHeaderDelegate(),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Workouts for ${_dateKey(selectedDate)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AddWorkoutButton(onPressed: _showAddWorkoutSheet),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              sliver: ValueListenableBuilder<Box<WorkoutLog>>(
                valueListenable: storageService.workoutLogsListenable,
                builder: (context, box, child) {
                  final workoutLogs = storageService.getWorkoutLogsByDate(
                    _dateKey(selectedDate),
                  );

                  if (workoutLogs.isEmpty) {
                    return SliverToBoxAdapter(
                      child: _EmptyWorkoutSection(
                        selectedDateLabel: _selectedDateLabel(selectedDate),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: WorkoutList(
                      workoutLogs: workoutLogs,
                      onToggle: storageService.toggleWorkoutCompletion,
                      onDelete: storageService.deleteWorkoutLog,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddWorkoutSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _AddWorkoutSheet(
          selectedDateKey: _dateKey(selectedDate),
          storageService: storageService,
        );
      },
    );
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _selectedDateLabel(DateTime date) {
    const monthLabels = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final month = monthLabels[date.month - 1];
    return '$month ${date.day}, ${date.year}';
  }
}

class _RestTimerHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 164;

  @override
  double get maxExtent => 164;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: const RestTimer(),
    );
  }

  @override
  bool shouldRebuild(covariant _RestTimerHeaderDelegate oldDelegate) {
    return false;
  }
}

class _EmptyWorkoutSection extends StatelessWidget {
  const _EmptyWorkoutSection({required this.selectedDateLabel});

  final String selectedDateLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedDateLabel,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text('No workouts added yet.'),
        ],
      ),
    );
  }
}

class _AddWorkoutSheet extends StatefulWidget {
  const _AddWorkoutSheet({
    required this.selectedDateKey,
    required this.storageService,
  });

  final String selectedDateKey;
  final StorageService storageService;

  @override
  State<_AddWorkoutSheet> createState() => _AddWorkoutSheetState();
}

class _AddWorkoutSheetState extends State<_AddWorkoutSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();
  final weightController = TextEditingController();

  String selectedCategory = workoutCategories.first;

  @override
  void dispose() {
    nameController.dispose();
    setsController.dispose();
    repsController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Workout',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Workout name',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter a workout name';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category',
                ),
                items: workoutCategories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: setsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sets',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: repsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reps',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saveWorkout,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveWorkout() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();
    final id = now.millisecondsSinceEpoch.toString();
    final workoutLog = WorkoutLog(
      id: id,
      date: widget.selectedDateKey,
      workoutId: id,
      workoutName: nameController.text.trim(),
      category: selectedCategory,
      isCompleted: false,
      sets: int.tryParse(setsController.text.trim()),
      reps: int.tryParse(repsController.text.trim()),
      weight: double.tryParse(weightController.text.trim()),
      createdAt: now,
    );

    await widget.storageService.addWorkoutLog(workoutLog);

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
