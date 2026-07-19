import 'dart:async';

import 'package:flutter/material.dart';

import '../models/current_workout_rest_state.dart';
import 'current_workout_palette.dart';

class RestTimerOverlay extends StatefulWidget {
  const RestTimerOverlay({super.key, required this.restState});

  final CurrentWorkoutRestState restState;

  @override
  State<RestTimerOverlay> createState() => _RestTimerOverlayState();
}

class _RestTimerOverlayState extends State<RestTimerOverlay> {
  static const int _initialSeconds = 90;
  static const int _extensionSeconds = 30;

  Timer? _timer;
  int _remainingSeconds = _initialSeconds;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _remainingSeconds / _initialSeconds;
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
          decoration: BoxDecoration(
            color: CurrentWorkoutPalette.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CurrentWorkoutPalette.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 26,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'REST TIMER',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: CurrentWorkoutPalette.secondaryText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _returnToWorkout,
                    tooltip: 'Close rest timer',
                    icon: const Icon(
                      Icons.close,
                      color: CurrentWorkoutPalette.primaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Rest after ${widget.restState.activeWorkoutName}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: CurrentWorkoutPalette.primaryText,
                  fontWeight: FontWeight.w900,
                  height: 1.12,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Next: ${widget.restState.nextWorkoutName}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CurrentWorkoutPalette.secondaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 168,
                      width: 168,
                      child: CircularProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        strokeWidth: 10,
                        backgroundColor: Colors.white.withValues(alpha: 0.08),
                        color: CurrentWorkoutPalette.accent,
                      ),
                    ),
                    Text(
                      _formatTime(_remainingSeconds),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: CurrentWorkoutPalette.primaryText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _skipRest,
                  style: FilledButton.styleFrom(
                    backgroundColor: CurrentWorkoutPalette.accent,
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Skip Rest'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _extendRest,
                      style: _secondaryButtonStyle(),
                      icon: const Icon(Icons.add),
                      label: const Text('Extend Rest'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _returnToWorkout,
                      style: _secondaryButtonStyle(),
                      icon: const Icon(Icons.keyboard_return),
                      label: const Text('Return'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_remainingSeconds <= 0) {
        timer.cancel();
        return;
      }

      setState(() {
        _remainingSeconds--;
      });
    });
  }

  void _extendRest() {
    setState(() {
      _remainingSeconds += _extensionSeconds;
    });
    _startTimer();
  }

  void _skipRest() {
    Navigator.pop(context, true);
  }

  void _returnToWorkout() {
    Navigator.pop(context, false);
  }

  ButtonStyle _secondaryButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: CurrentWorkoutPalette.primaryText,
      side: const BorderSide(color: CurrentWorkoutPalette.border),
      minimumSize: const Size.fromHeight(52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontWeight: FontWeight.w800),
    );
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
