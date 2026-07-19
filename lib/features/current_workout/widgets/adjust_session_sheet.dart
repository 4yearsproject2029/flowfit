import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import 'current_workout_palette.dart';

class SessionAdjustment {
  const SessionAdjustment({required this.reps, required this.weight});

  final int? reps;
  final double? weight;
}

class AdjustSessionSheet extends StatefulWidget {
  const AdjustSessionSheet({
    super.key,
    required this.workoutLog,
    required this.sessionReps,
    required this.sessionWeight,
  });

  final WorkoutLog workoutLog;
  final int? sessionReps;
  final double? sessionWeight;

  @override
  State<AdjustSessionSheet> createState() => _AdjustSessionSheetState();
}

class _AdjustSessionSheetState extends State<AdjustSessionSheet> {
  late final TextEditingController _repsController;
  late final TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _repsController = TextEditingController(
      text: widget.sessionReps?.toString() ?? '',
    );
    _weightController = TextEditingController(
      text: widget.sessionWeight == null
          ? ''
          : _formatWeight(widget.sessionWeight!),
    );
  }

  @override
  void dispose() {
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, bottomInset + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Adjust session',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: CurrentWorkoutPalette.primaryText,
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
                    color: CurrentWorkoutPalette.primaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              widget.workoutLog.workoutName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CurrentWorkoutPalette.secondaryText,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: CurrentWorkoutPalette.primaryText),
              decoration: _inputDecoration('Current reps'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(color: CurrentWorkoutPalette.primaryText),
              decoration: _inputDecoration('Current weight'),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _saveAdjustment,
                style: FilledButton.styleFrom(
                  backgroundColor: CurrentWorkoutPalette.accent,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.w900),
                ),
                icon: const Icon(Icons.check),
                label: const Text('Save Adjustment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: CurrentWorkoutPalette.secondaryText),
      filled: true,
      fillColor: CurrentWorkoutPalette.elevated,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CurrentWorkoutPalette.border),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CurrentWorkoutPalette.accent),
      ),
    );
  }

  void _saveAdjustment() {
    Navigator.pop(
      context,
      SessionAdjustment(
        reps: _parsePositiveInt(_repsController.text),
        weight: _parsePositiveDouble(_weightController.text),
      ),
    );
  }

  int? _parsePositiveInt(String value) {
    final parsedValue = int.tryParse(value.trim());
    if (parsedValue == null || parsedValue < 1) {
      return null;
    }

    return parsedValue;
  }

  double? _parsePositiveDouble(String value) {
    final parsedValue = double.tryParse(value.trim());
    if (parsedValue == null || parsedValue <= 0) {
      return null;
    }

    return parsedValue;
  }

  String _formatWeight(double weight) {
    if (weight == weight.roundToDouble()) {
      return weight.round().toString();
    }

    return weight.toStringAsFixed(1);
  }
}
