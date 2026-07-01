import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../../data/services/weekly_goal_service.dart';
import '../models/share_card_data.dart';
import '../services/share_card_service.dart';
import 'share_card_preview.dart';

class ShareCardsSection extends StatelessWidget {
  const ShareCardsSection({
    super.key,
    required this.selectedDateLabel,
    required this.workoutLogs,
    required this.xpTotal,
    required this.weeklyGoalProgress,
    required this.storageService,
  });

  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;
  final int xpTotal;
  final WeeklyGoalProgress? weeklyGoalProgress;
  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    final service = ShareCardService();
    final workoutCard = service.workoutCompletionCard(
      workoutLogs: workoutLogs,
      dateLabel: selectedDateLabel,
      includePerformanceMetrics: storageService
          .shouldShowShareCardWorkoutMetrics(),
    );
    final levelCard = service.levelCard(xpTotal: xpTotal);
    final weeklyCard = service.weeklyGoalCard(progress: weeklyGoalProgress);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Share cards',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Make a private-by-default card when you want to celebrate.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ShareCardAction(
              label: 'Workout',
              card: workoutCard,
              cardBuilder: (includePerformanceMetrics) {
                return service.workoutCompletionCard(
                  workoutLogs: workoutLogs,
                  dateLabel: selectedDateLabel,
                  includePerformanceMetrics: includePerformanceMetrics,
                );
              },
              storageService: storageService,
              unavailableMessage:
                  'Complete a workout on this date to make a card.',
            ),
            _ShareCardAction(
              label: 'Level',
              card: levelCard,
              storageService: storageService,
            ),
            _ShareCardAction(
              label: 'Weekly',
              card: weeklyCard,
              storageService: storageService,
              unavailableMessage: 'Reach your weekly goal to make this card.',
            ),
          ],
        ),
      ],
    );
  }
}

class _ShareCardAction extends StatelessWidget {
  const _ShareCardAction({
    required this.label,
    required this.card,
    this.cardBuilder,
    this.storageService,
    this.unavailableMessage,
  });

  final String label;
  final ShareCardData? card;
  final ShareCardData? Function(bool includePerformanceMetrics)? cardBuilder;
  final StorageService? storageService;
  final String? unavailableMessage;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final cardData = card;
        if (cardData == null) {
          _showUnavailableMessage(context);
          return;
        }

        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.9,
          ),
          builder: (context) {
            return _ShareCardPreviewSheet(
              card: cardData,
              cardBuilder: cardBuilder,
              storageService: storageService,
            );
          },
        );
      },
      child: Text(label),
    );
  }

  void _showUnavailableMessage(BuildContext context) {
    final message = unavailableMessage;
    if (message == null) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ShareCardPreviewSheet extends StatefulWidget {
  const _ShareCardPreviewSheet({
    required this.card,
    this.cardBuilder,
    this.storageService,
  });

  final ShareCardData card;
  final ShareCardData? Function(bool includePerformanceMetrics)? cardBuilder;
  final StorageService? storageService;

  @override
  State<_ShareCardPreviewSheet> createState() => _ShareCardPreviewSheetState();
}

class _ShareCardPreviewSheetState extends State<_ShareCardPreviewSheet> {
  bool hasGenerated = false;
  late bool showWorkoutMetrics;

  @override
  void initState() {
    super.initState();
    showWorkoutMetrics =
        widget.storageService?.shouldShowShareCardWorkoutMetrics() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.cardBuilder?.call(showWorkoutMetrics) ?? widget.card;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Share card preview',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShareCardPreview(card: card),
              const SizedBox(height: 12),
              Text(
                'Performance numbers are hidden by default.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              if (widget.cardBuilder != null &&
                  widget.storageService != null) ...[
                const SizedBox(height: 8),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Show workout metrics'),
                  subtitle: const Text(
                    'Adds sets, reps, or weight when available.',
                  ),
                  value: showWorkoutMetrics,
                  onChanged: (value) async {
                    final isEnabled = value ?? false;
                    setState(() {
                      showWorkoutMetrics = isEnabled;
                    });
                    await widget.storageService
                        ?.saveShareCardWorkoutMetricsPreference(isEnabled);
                  },
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      hasGenerated = true;
                    });
                    final storageService = widget.storageService;
                    if (storageService != null) {
                      unawaited(storageService.recordShareCardGenerated());
                    }
                  },
                  child: const Text('Generate'),
                ),
              ),
              if (hasGenerated) ...[
                const SizedBox(height: 12),
                Text(
                  card.confirmationLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
