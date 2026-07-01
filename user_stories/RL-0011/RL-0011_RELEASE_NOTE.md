# RL-0011 Release Note

## Document Metadata

Story ID:

```text
RL-0011
```

Epic:

```text
EP-08 Privacy
```

Release Date:

```text
2026-07-01
```

Release Manager:

```text
Release Manager Agent
```

Status:

```text
Released
```

---

## Release Summary

RL-0011 released share-card privacy controls. Workout share cards remain private by default and can optionally include supported workout metrics only after the user explicitly enables the workout metrics control.

---

## Scope Released

* Added local share-card workout metric preference storage.
* Added explicit workout preview-sheet control for showing supported metrics.
* Added card support for opt-in sets, reps, and weight details.
* Preserved privacy-safe defaults for workout cards.
* Preserved existing level and weekly share-card behavior.
* Preserved local-only, user-initiated Generate behavior.

---

## Acceptance Criteria Result

| Acceptance Criteria | Result |
| ------------------- | ------ |
| Share cards show consistency-focused metrics by default. | Passed |
| Users can preview cards before sharing. | Passed |
| Hidden performance metrics require explicit opt-in. | Passed |
| Share cards are never published automatically. | Passed |
| Share preferences persist locally. | Passed |

---

## Verification

```bash
flutter test test/share_card_service_test.dart test/storage_service_test.dart -r expanded
flutter test test/widget_test.dart -r expanded
flutter analyze
flutter test -r expanded
```

Results:

* Targeted service/storage tests passed.
* Widget test file passed with 8 passing tests and 3 documented skipped tests.
* `flutter analyze` passed with no issues.
* Full Flutter test suite passed with 33 passing tests and 3 documented skipped tests.

---

## Known Limitations

* The opt-in share-card metrics persistence widget test is skipped due to a known widget-test/Hive async cleanup limitation. The test passes alone but poisons the next weekly share-card test at Hive reset when run in sequence.
* This limitation is not classified as a production behavior failure because service/storage tests verify opt-in metrics and persisted preference behavior.
* Recommended follow-up: add a storage abstraction or fake implementation for Hive-backed widget tests.
* Native share-sheet export, public sharing, analytics, backend sync, and validation dashboards remain outside RL-0011 scope.

---

## Final Decision

```text
Released
```

Decision rationale:

* Code review approved RL-0011 with no production blockers.
* QA passed with a documented test-harness limitation.
* Static analysis passed.
* Full automated test suite passed.
* No story-level release blockers remain.

