import 'package:flutter/material.dart';

import '../../../data/models/workout_category.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';

class WorkoutPlanBuilderScreen extends StatefulWidget {
  WorkoutPlanBuilderScreen({
    super.key,
    required this.selectedDateKey,
    required this.selectedDateLabel,
    StorageService? storageService,
  }) : storageService = storageService ?? StorageService();

  final String selectedDateKey;
  final String selectedDateLabel;
  final StorageService storageService;

  static const background = Color(0xFF050606);
  static const surface = Color(0xFF101214);
  static const elevated = Color(0xFF181B1F);
  static const border = Color(0xFF252A2E);
  static const accent = Color(0xFF18F7D3);
  static const accentDark = Color(0xFF073F39);
  static const primaryText = Color(0xFFF5F6F7);
  static const secondaryText = Color(0xFFA8AFB7);
  static const mutedText = Color(0xFF6F767E);

  @override
  State<WorkoutPlanBuilderScreen> createState() =>
      _WorkoutPlanBuilderScreenState();
}

class _WorkoutPlanBuilderScreenState extends State<WorkoutPlanBuilderScreen> {
  late final TextEditingController _titleController;
  late List<WorkoutLog> _exerciseLogs;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.storageService.getWorkoutSessionTitle(
        widget.selectedDateKey,
      ),
    );
    _exerciseLogs = widget.storageService.getWorkoutLogsByDate(
      widget.selectedDateKey,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WorkoutPlanBuilderScreen.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BuilderHeader(dateLabel: widget.selectedDateLabel),
                    const SizedBox(height: 28),
                    Text(
                      'WORKOUT PLAN BUILDER',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: WorkoutPlanBuilderScreen.secondaryText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        color: WorkoutPlanBuilderScreen.primaryText,
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: WorkoutPlanBuilderScreen.surface,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: WorkoutPlanBuilderScreen.border,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: WorkoutPlanBuilderScreen.accent,
                          ),
                        ),
                        labelText: 'Session title',
                        labelStyle: TextStyle(
                          color: WorkoutPlanBuilderScreen.secondaryText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _SessionSummary(exerciseLogs: _exerciseLogs),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Exercises',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: WorkoutPlanBuilderScreen.primaryText,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: _openAddExerciseSheet,
                          style: TextButton.styleFrom(
                            foregroundColor: WorkoutPlanBuilderScreen.accent,
                          ),
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (_exerciseLogs.isEmpty)
                      const _EmptyExerciseState()
                    else
                      for (var index = 0; index < _exerciseLogs.length; index++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ExercisePlanTile(
                            exerciseNumber: index + 1,
                            workoutLog: _exerciseLogs[index],
                            onEdit: () {
                              _openEditExerciseSheet(_exerciseLogs[index]);
                            },
                            onDelete: () {
                              _deleteExercise(_exerciseLogs[index]);
                            },
                          ),
                        ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _exerciseLogs.isEmpty ? null : _savePlan,
                        style: FilledButton.styleFrom(
                          backgroundColor: WorkoutPlanBuilderScreen.accent,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor:
                              WorkoutPlanBuilderScreen.border,
                          disabledForegroundColor:
                              WorkoutPlanBuilderScreen.mutedText,
                          minimumSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Save Workout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePlan() async {
    await widget.storageService.saveWorkoutSessionTitle(
      date: widget.selectedDateKey,
      title: _titleController.text,
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _openAddExerciseSheet() async {
    final workoutLog = await showModalBottomSheet<WorkoutLog>(
      context: context,
      isScrollControlled: true,
      backgroundColor: WorkoutPlanBuilderScreen.surface,
      builder: (context) {
        return _ExerciseEditorSheet(selectedDateKey: widget.selectedDateKey);
      },
    );

    if (workoutLog == null) {
      return;
    }

    await widget.storageService.addWorkoutLog(workoutLog);
    _refreshExerciseLogs();
  }

  Future<void> _openEditExerciseSheet(WorkoutLog workoutLog) async {
    final updatedWorkoutLog = await showModalBottomSheet<WorkoutLog>(
      context: context,
      isScrollControlled: true,
      backgroundColor: WorkoutPlanBuilderScreen.surface,
      builder: (context) {
        return _ExerciseEditorSheet(
          selectedDateKey: widget.selectedDateKey,
          initialWorkoutLog: workoutLog,
        );
      },
    );

    if (updatedWorkoutLog == null) {
      return;
    }

    await widget.storageService.updateWorkoutLog(updatedWorkoutLog);
    _refreshExerciseLogs();
  }

  Future<void> _deleteExercise(WorkoutLog workoutLog) async {
    await widget.storageService.deleteWorkoutLog(workoutLog.id);
    _refreshExerciseLogs();
  }

  void _refreshExerciseLogs() {
    setState(() {
      _exerciseLogs = widget.storageService.getWorkoutLogsByDate(
        widget.selectedDateKey,
      );
    });
  }
}

class _BuilderHeader extends StatelessWidget {
  const _BuilderHeader({required this.dateLabel});

  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back to dashboard',
          icon: const Icon(
            Icons.arrow_back,
            color: WorkoutPlanBuilderScreen.primaryText,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: WorkoutPlanBuilderScreen.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: WorkoutPlanBuilderScreen.border),
          ),
          child: Text(
            dateLabel,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: WorkoutPlanBuilderScreen.secondaryText,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _SessionSummary extends StatelessWidget {
  const _SessionSummary({required this.exerciseLogs});

  final List<WorkoutLog> exerciseLogs;

  @override
  Widget build(BuildContext context) {
    final exerciseCount = exerciseLogs.length;
    final totalSets = exerciseLogs.fold<int>(
      0,
      (total, log) =>
          total + (log.sets == null || log.sets! < 1 ? 1 : log.sets!),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WorkoutPlanBuilderScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutPlanBuilderScreen.border),
      ),
      child: Row(
        children: [
          _SummaryValue(label: 'Exercises', value: '$exerciseCount'),
          const SizedBox(width: 10),
          _SummaryValue(label: 'Sets', value: '$totalSets'),
          const SizedBox(width: 10),
          const _SummaryValue(label: 'Order', value: 'Added'),
        ],
      ),
    );
  }
}

class _SummaryValue extends StatelessWidget {
  const _SummaryValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: WorkoutPlanBuilderScreen.mutedText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: WorkoutPlanBuilderScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyExerciseState extends StatelessWidget {
  const _EmptyExerciseState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: WorkoutPlanBuilderScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutPlanBuilderScreen.border),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.add_task,
            color: WorkoutPlanBuilderScreen.accent,
            size: 42,
          ),
          const SizedBox(height: 10),
          Text(
            'Add at least one exercise',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: WorkoutPlanBuilderScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Saved sessions need one valid exercise before they can start.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: WorkoutPlanBuilderScreen.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExercisePlanTile extends StatelessWidget {
  const _ExercisePlanTile({
    required this.exerciseNumber,
    required this.workoutLog,
    required this.onEdit,
    required this.onDelete,
  });

  final int exerciseNumber;
  final WorkoutLog workoutLog;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WorkoutPlanBuilderScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutPlanBuilderScreen.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: WorkoutPlanBuilderScreen.accentDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$exerciseNumber',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: WorkoutPlanBuilderScreen.accent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workoutLog.workoutName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: WorkoutPlanBuilderScreen.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _exerciseDetails(workoutLog),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: WorkoutPlanBuilderScreen.secondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            tooltip: 'Edit exercise',
            icon: const Icon(
              Icons.edit_outlined,
              color: WorkoutPlanBuilderScreen.accent,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            tooltip: 'Delete exercise',
            icon: const Icon(
              Icons.delete_outline,
              color: WorkoutPlanBuilderScreen.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  String _exerciseDetails(WorkoutLog workoutLog) {
    final sets = workoutLog.sets ?? 1;
    final reps = workoutLog.reps == null
        ? 'reps not set'
        : '${workoutLog.reps} reps';
    final weight = workoutLog.weight == null
        ? ''
        : ' - ${_formatWeight(workoutLog.weight!)} kg';

    return '${workoutLog.category} - $sets sets - $reps$weight';
  }

  String _formatWeight(double weight) {
    if (weight == weight.roundToDouble()) {
      return weight.toStringAsFixed(0);
    }

    return weight.toString();
  }
}

class _ExerciseEditorSheet extends StatefulWidget {
  const _ExerciseEditorSheet({
    required this.selectedDateKey,
    this.initialWorkoutLog,
  });

  final String selectedDateKey;
  final WorkoutLog? initialWorkoutLog;

  @override
  State<_ExerciseEditorSheet> createState() => _ExerciseEditorSheetState();
}

class _ExerciseEditorSheetState extends State<_ExerciseEditorSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _setsController;
  late final TextEditingController _repsController;
  late final TextEditingController _weightController;
  late final TextEditingController _memoController;
  late String _selectedCategory;

  bool get _isEditing => widget.initialWorkoutLog != null;

  @override
  void initState() {
    super.initState();
    final workoutLog = widget.initialWorkoutLog;
    _nameController = TextEditingController(text: workoutLog?.workoutName);
    _setsController = TextEditingController(text: workoutLog?.sets?.toString());
    _repsController = TextEditingController(text: workoutLog?.reps?.toString());
    _weightController = TextEditingController(
      text: workoutLog?.weight?.toString(),
    );
    _memoController = TextEditingController(text: workoutLog?.memo);
    _selectedCategory = workoutLog?.category ?? workoutCategories.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 18,
          top: 18,
          right: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _isEditing ? 'Edit Exercise' : 'Add Exercise',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: WorkoutPlanBuilderScreen.primaryText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: 'Close',
                    icon: const Icon(
                      Icons.close,
                      color: WorkoutPlanBuilderScreen.secondaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _textField(
                controller: _nameController,
                label: 'Exercise name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter an exercise name';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                dropdownColor: WorkoutPlanBuilderScreen.surface,
                style: const TextStyle(
                  color: WorkoutPlanBuilderScreen.primaryText,
                ),
                decoration: _inputDecoration('Category'),
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
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _textField(
                      controller: _setsController,
                      label: 'Sets',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _textField(
                      controller: _repsController,
                      label: 'Reps',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _textField(
                controller: _weightController,
                label: 'Weight',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 12),
              _textField(
                controller: _memoController,
                label: 'Memo',
                minLines: 1,
                maxLines: 3,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _saveExercise,
                  style: FilledButton.styleFrom(
                    backgroundColor: WorkoutPlanBuilderScreen.accent,
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  icon: const Icon(Icons.check),
                  label: Text(_isEditing ? 'Save Exercise' : 'Add Exercise'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    int? minLines,
    int? maxLines,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      style: const TextStyle(color: WorkoutPlanBuilderScreen.primaryText),
      decoration: _inputDecoration(label),
      validator: validator,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: WorkoutPlanBuilderScreen.elevated,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: WorkoutPlanBuilderScreen.border),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: WorkoutPlanBuilderScreen.accent),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      labelText: label,
      labelStyle: const TextStyle(
        color: WorkoutPlanBuilderScreen.secondaryText,
      ),
    );
  }

  void _saveExercise() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();
    final initialWorkoutLog = widget.initialWorkoutLog;
    final id = initialWorkoutLog?.id ?? now.microsecondsSinceEpoch.toString();
    final workoutLog = WorkoutLog(
      id: id,
      date: widget.selectedDateKey,
      workoutId: initialWorkoutLog?.workoutId ?? id,
      workoutName: _nameController.text.trim(),
      category: _selectedCategory,
      isCompleted: initialWorkoutLog?.isCompleted ?? false,
      sets: int.tryParse(_setsController.text.trim()),
      reps: int.tryParse(_repsController.text.trim()),
      weight: double.tryParse(_weightController.text.trim()),
      memo: _optionalText(_memoController.text),
      createdAt: initialWorkoutLog?.createdAt ?? now,
    );

    Navigator.pop(context, workoutLog);
  }

  String? _optionalText(String value) {
    final trimmedValue = value.trim();
    return trimmedValue.isEmpty ? null : trimmedValue;
  }
}
