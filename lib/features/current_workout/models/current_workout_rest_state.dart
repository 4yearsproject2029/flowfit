class CurrentWorkoutRestState {
  const CurrentWorkoutRestState({
    required this.activeWorkoutName,
    required this.completedSetNumber,
    required this.completedSetTotal,
    required this.nextWorkoutName,
    required this.nextExerciseIndex,
    required this.suggestedRestDuration,
    required this.returnTarget,
  });

  final String activeWorkoutName;
  final int completedSetNumber;
  final int completedSetTotal;
  final String nextWorkoutName;
  final int nextExerciseIndex;
  final String suggestedRestDuration;
  final String returnTarget;
}
