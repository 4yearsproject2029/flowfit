import 'package:flutter/material.dart';

import '../models/share_card_data.dart';

class ShareCardPreview extends StatelessWidget {
  const ShareCardPreview({super.key, required this.card});

  final ShareCardData card;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardColors = _colorsForType(colorScheme, card.type);

    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: cardColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RepLog',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: cardColors.foreground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              card.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: cardColors.foreground,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              card.message,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: cardColors.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              card.detail,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: cardColors.foreground),
            ),
          ],
        ),
      ),
    );
  }

  _ShareCardColors _colorsForType(ColorScheme colorScheme, ShareCardType type) {
    switch (type) {
      case ShareCardType.workout:
        return _ShareCardColors(
          background: colorScheme.primaryContainer,
          foreground: colorScheme.onPrimaryContainer,
          border: colorScheme.primary.withValues(alpha: 0.24),
        );
      case ShareCardType.level:
        return _ShareCardColors(
          background: colorScheme.secondaryContainer,
          foreground: colorScheme.onSecondaryContainer,
          border: colorScheme.secondary.withValues(alpha: 0.24),
        );
      case ShareCardType.weeklyGoal:
        return _ShareCardColors(
          background: colorScheme.tertiaryContainer,
          foreground: colorScheme.onTertiaryContainer,
          border: colorScheme.tertiary.withValues(alpha: 0.24),
        );
    }
  }
}

class _ShareCardColors {
  const _ShareCardColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
