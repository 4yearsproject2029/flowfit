# RL-0013 UX Specification

## Story

RL-0013 - MVP Quality

## Status

Complete

## UX Goal

Make the current MVP usable during workouts by preserving readable text, stable scrolling, and comfortable touch targets without redesigning the home experience.

## Screen Review

Onboarding:

- Uses a single-column scrollable layout.
- Weekly goal options have clear labels and minimum 56px rows.
- Continue action spans the available width.
- Local-only data notice remains visible.

Home:

- Uses a scrollable layout for dense MVP content.
- The pinned rest timer stays visible and must not overflow.
- XP, level, weekly goal, share cards, planned rest, and workout list remain in the same flow.
- Content below the first viewport is acceptable because the page is intentionally scrollable.

Share cards:

- Share-card actions remain optional and user-initiated.
- Preview sheet is scrollable and includes a close affordance.
- Workout performance metrics remain hidden by default unless explicitly enabled.

## UX Finding

The rest timer used compact shrink-wrapped controls. That was usable visually, but it did not satisfy the RL-0013 large-touch-target acceptance criterion.

## UX Decision

- Keep the existing HomeScreen structure.
- Keep the stable rest timer header height that avoids overflow.
- Increase rest timer chips and buttons to padded 48px-compatible tap targets.
- Update widget assertions to scroll to below-fold content instead of requiring all summaries above the fold.

