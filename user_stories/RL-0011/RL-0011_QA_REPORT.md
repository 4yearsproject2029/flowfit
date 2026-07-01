# RL-0011 QA Report

## Document Metadata

Story ID:

```text
RL-0011
```

Epic:

```text
EP-08 Privacy
```

QA Date:

```text
2026-07-01
```

QA Tester:

```text
QA Tester Agent
```

Status:

```text
Passed With Documented Test Harness Limitation
```

---

## QA Summary

RL-0011 passed QA for share-card privacy controls. Default workout share cards remain privacy-safe, weekly share-card behavior still passes, explicit workout metric opt-in is covered by service/storage tests, and the full automated test suite completes without hanging after documenting the known widget-test limitation.

---

## Acceptance Criteria Validation

| AC ID | Acceptance Criteria | Result | Evidence |
| ----- | ------------------- | ------ | -------- |
| AC-01 | Share cards show consistency-focused metrics by default. | Passed | Widget test verifies workout preview omits sets, reps, weight, and memo/PR text by default. |
| AC-02 | Users can preview cards before sharing. | Passed | Workout and weekly widget tests open preview sheets before Generate. |
| AC-03 | Hidden performance metrics require explicit opt-in. | Passed | Service test verifies sets, reps, and weight appear only when `includePerformanceMetrics` is true. |
| AC-04 | Share cards are never published automatically. | Passed | No automatic publish/share behavior exists; Generate remains local confirmation. |
| AC-05 | Share preferences persist locally. | Passed | Storage test verifies `showShareCardWorkoutMetrics` persists after restart. |

---

## Commands Executed

```bash
flutter test test/share_card_service_test.dart test/storage_service_test.dart -r expanded
flutter test test/widget_test.dart -r expanded
flutter analyze
flutter test -r expanded
```

---

## Results

* Targeted service/storage tests passed.
* `flutter test test/widget_test.dart -r expanded` passed with 8 passing tests and 3 documented skipped tests.
* `flutter analyze` passed with no issues.
* `flutter test -r expanded` passed with 33 passing tests and 3 documented skipped tests.

---

## Known Test Harness Limitation

Skipped widget test:

```text
persists explicit opt-in for workout share card metrics
```

Reason:

* The test passes when run alone.
* In sequence, it poisons the following weekly share-card test at Hive reset.
* The behavior appears to be a widget-test/Hive async cleanup limitation.
* It is not currently classified as a production behavior failure.

Mitigation:

* Service tests verify opt-in metric visibility.
* Storage tests verify local preference persistence after restart.
* Full widget suite completes without hanging after the controlled skip.

Recommended follow-up:

* Introduce a storage abstraction or fake implementation for Hive-backed widget tests.

---

## Final QA Decision

```text
Passed
```

