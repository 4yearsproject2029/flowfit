import 'dart:async';

import 'package:flutter/material.dart';

class RestTimer extends StatefulWidget {
  const RestTimer({super.key});

  @override
  State<RestTimer> createState() => _RestTimerState();
}

class _RestTimerState extends State<RestTimer> {
  final presetDurations = const [30, 60, 90, 120, 180, 300];

  Timer? timer;
  int selectedDuration = 60;
  int remainingSeconds = 60;
  bool isRunning = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rest Timer',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                _formatTime(remainingSeconds),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: presetDurations.map((seconds) {
                final isSelected = seconds == selectedDuration;

                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    label: Text(_presetLabel(seconds)),
                    selected: isSelected,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    onSelected: (selected) {
                      _selectDuration(seconds);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              FilledButton(
                onPressed: isRunning ? null : _startTimer,
                style: _compactButtonStyle(),
                child: const Text('Start'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: isRunning ? _stopTimer : null,
                style: _compactButtonStyle(),
                child: const Text('Stop'),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: _resetTimer,
                style: _compactButtonStyle(),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _selectDuration(int seconds) {
    setState(() {
      selectedDuration = seconds;

      if (!isRunning) {
        remainingSeconds = seconds;
      }
    });
  }

  void _startTimer() {
    timer?.cancel();

    if (remainingSeconds == 0) {
      remainingSeconds = selectedDuration;
    }

    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (remainingSeconds <= 1) {
        setState(() {
          remainingSeconds = 0;
          isRunning = false;
        });
        timer.cancel();
        return;
      }

      setState(() {
        remainingSeconds--;
      });
    });
  }

  void _stopTimer() {
    timer?.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void _resetTimer() {
    timer?.cancel();

    setState(() {
      remainingSeconds = selectedDuration;
      isRunning = false;
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  String _presetLabel(int seconds) {
    if (seconds < 60) {
      return '${seconds}s';
    }

    if (seconds % 60 == 0) {
      return '${seconds ~/ 60}m';
    }

    return '${seconds}s';
  }

  ButtonStyle _compactButtonStyle() {
    return const ButtonStyle(
      visualDensity: VisualDensity.compact,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
