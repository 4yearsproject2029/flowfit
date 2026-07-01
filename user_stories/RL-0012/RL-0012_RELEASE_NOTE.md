# RL-0012 Release Note

## Story

RL-0012 - MVP Validation Metrics

## Status

Done

## Summary

RepLog now calculates local MVP validation metrics from on-device data. The implementation keeps metrics local-only and does not add backend services, login, cloud sync, external analytics SDKs, social features, public ranking, or a dashboard.

## Delivered

- Local weekly goal completion rate.
- Local average completed workouts per week.
- Local average share cards generated per week.
- Local return-after-missed-workout-week metric using existing consistency recovery rules.
- Local share-card generation counts persisted by date.

## Validation

- `flutter test test/mvp_validation_metrics_service_test.dart test/storage_service_test.dart -r expanded` passed.
- `flutter test test/widget_test.dart -r expanded` passed with 7 passing tests and 4 documented skipped tests.
- `flutter test -r expanded` passed with 37 passing tests and 4 documented skipped tests.
- `flutter analyze` passed with no issues.

## Known Limitation

- The share-card generation widget test is skipped because the widget-test harness can hang when a modal callback starts an async Hive write before the next Hive reset.
- The test-harness limitation is not currently classified as an app-breaking production behavior failure.
- Metric and generation-count production behavior is covered by service/storage tests.
- Follow-up recommended: storage abstraction or fake implementation for Hive-backed widget tests.

## Next Recommended Story

RL-0013
