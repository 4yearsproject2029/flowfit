import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../calendar/widgets/weekly_calendar.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This Week',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
              const SizedBox(height: 28),
              Text(
                'Workouts for ${_dateKey(selectedDate)}',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ValueListenableBuilder<Box<WorkoutLog>>(
                  valueListenable: storageService.workoutLogsListenable,
                  builder: (context, box, child) {
                    final workoutLogs = storageService.getWorkoutLogsByDate(
                      _dateKey(selectedDate),
                    );

                    if (workoutLogs.isEmpty) {
                      return _EmptyWorkoutSection(
                        selectedDateLabel: _selectedDateLabel(selectedDate),
                      );
                    }

                    return ListView.separated(
                      itemCount: workoutLogs.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                      itemBuilder: (context, index) {
                        final workoutLog = workoutLogs[index];

                        return _WorkoutLogTile(
                          workoutLog: workoutLog,
                          onToggle: () {
                            storageService.toggleWorkoutCompletion(
                              workoutLog.id,
                            );
                          },
                          onDelete: () {
                            storageService.deleteWorkoutLog(workoutLog.id);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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

class _WorkoutLogTile extends StatelessWidget {
  const _WorkoutLogTile({
    required this.workoutLog,
    required this.onToggle,
    required this.onDelete,
  });

  final WorkoutLog workoutLog;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final details = <String>[
      if (workoutLog.sets != null) '${workoutLog.sets} sets',
      if (workoutLog.reps != null) '${workoutLog.reps} reps',
      if (workoutLog.weight != null) '${workoutLog.weight} kg',
    ].join(' · ');

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Checkbox(
          value: workoutLog.isCompleted,
          onChanged: (value) {
            onToggle();
          },
        ),
        title: Text(
          workoutLog.workoutName,
          style: TextStyle(
            decoration: workoutLog.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          details.isEmpty
              ? workoutLog.category
              : '${workoutLog.category} · $details',
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
