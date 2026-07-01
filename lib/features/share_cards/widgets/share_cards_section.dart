import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
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
  });

  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;
  final int xpTotal;
  final WeeklyGoalProgress? weeklyGoalProgress;

  @override
  Widget build(BuildContext context) {
    final service = ShareCardService();
    final workoutCard = service.workoutCompletionCard(
      workoutLogs: workoutLogs,
      dateLabel: selectedDateLabel,
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
              unavailableMessage:
                  'Complete a workout on this date to make a card.',
            ),
            _ShareCardAction(label: 'Level', card: levelCard),
            _ShareCardAction(
              label: 'Weekly',
              card: weeklyCard,
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
    this.unavailableMessage,
  });

  final String label;
  final ShareCardData? card;
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
          builder: (context) {
            return _ShareCardPreviewSheet(card: cardData);
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
  const _ShareCardPreviewSheet({required this.card});

  final ShareCardData card;

  @override
  State<_ShareCardPreviewSheet> createState() => _ShareCardPreviewSheetState();
}

class _ShareCardPreviewSheetState extends State<_ShareCardPreviewSheet> {
  bool hasGenerated = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            ShareCardPreview(card: widget.card),
            const SizedBox(height: 12),
            Text(
              'Performance numbers are hidden by default.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    hasGenerated = true;
                  });
                },
                child: const Text('Generate'),
              ),
            ),
            if (hasGenerated) ...[
              const SizedBox(height: 12),
              Text(
                widget.card.confirmationLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
