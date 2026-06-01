# FlowFit — 데이터베이스 스키마 설계

## Storage

FlowFit MVP는 로컬 저장소로 Hive를 사용한다.

## Hive Boxes

### 1. workoutBox

운동 마스터 데이터를 저장한다.

현재 MVP에서는 필수 사용 비중이 낮지만, 향후 운동 템플릿/운동 사전 기능을 위해 유지한다.

### Workout

| Field | Type | Required | Description |
|---|---|---|---|
| id | String | Yes | 운동 고유 ID |
| name | String | Yes | 운동 이름 |
| category | String | Yes | 운동 부위 |
| description | String? | No | 운동 설명 |
| defaultSets | int? | No | 기본 세트 수 |
| defaultReps | int? | No | 기본 반복 수 |

---

### 2. workoutLogBox

날짜별 운동 기록을 저장한다.  
현재 MVP의 핵심 데이터이다.

### WorkoutLog

| Field | Type | Required | Description |
|---|---|---|---|
| id | String | Yes | 운동 기록 고유 ID |
| date | String | Yes | 운동 날짜, `yyyy-MM-dd` |
| workoutId | String | Yes | 참조용 운동 ID |
| workoutName | String | Yes | 운동 이름 |
| category | String | Yes | 운동 부위 |
| isCompleted | bool | Yes | 완료 여부 |
| sets | int? | No | 세트 수 |
| reps | int? | No | 반복 수 |
| weight | double? | No | 중량 |
| memo | String? | No | 메모 |
| createdAt | DateTime | Yes | 생성 시각 |

---

## Category Values

MVP에서 사용하는 운동 부위 값:

```text
chest
back
legs
shoulders
arms
abs
cardio
```

---

## Date Key Format

날짜별 조회는 문자열 key를 사용한다.

```text
yyyy-MM-dd
```

예:

```text
2026-05-26
```

---

## Example Data

### WorkoutLog Example

```json
{
  "id": "1716712345678",
  "date": "2026-05-26",
  "workoutId": "1716712345678",
  "workoutName": "Bench Press",
  "category": "chest",
  "isCompleted": false,
  "sets": 4,
  "reps": 10,
  "weight": 60.0,
  "memo": null,
  "createdAt": "2026-05-26T17:30:00"
}
```

---

## Data Flow

```text
User selects date
→ User adds workout
→ App creates WorkoutLog
→ StorageService saves to workoutLogBox
→ HomeScreen reads logs by selected date
→ WorkoutList displays logs
```

---

## Current MVP Behavior

- 날짜별 운동 기록 저장
- 앱 재실행 후 데이터 유지
- 완료 상태 저장
- 삭제 가능
- sets / reps / weight 저장 가능

---

## Known Design Decision

현재 MVP에서는 `Workout`과 `WorkoutLog`를 분리한다.

### Workout
운동 종류 또는 템플릿 역할

### WorkoutLog
특정 날짜에 수행한 운동 기록 역할

이 구조를 사용하면 나중에 다음 기능을 확장하기 쉽다:

- 운동 템플릿
- 자주 하는 운동 목록
- 운동 볼륨 계산
- 운동 히스토리
- 통계 대시보드

---

## Future Extension

### Volume Tracking

향후 운동 볼륨 계산 가능:

```text
volume = sets × reps × weight
```

### Possible Future Fields

| Field | Type | Description |
|---|---|---|
| duration | int? | 운동 시간 |
| restTime | int? | 휴식 시간 |
| personalRecord | bool | PR 여부 |
| notes | String? | 상세 메모 |
| updatedAt | DateTime | 수정 시각 |

---

## MVP Non-Goals

현재 스키마에서는 다음을 포함하지 않는다:

- 사용자 계정
- 클라우드 동기화
- Firebase
- Apple Watch 데이터
- 운동 통계 테이블
- 소셜 데이터