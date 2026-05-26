import 'package:hive/hive.dart';

class WorkoutLog {
  const WorkoutLog({
    required this.id,
    required this.date,
    required this.workoutId,
    required this.workoutName,
    required this.category,
    required this.isCompleted,
    this.sets,
    this.reps,
    this.weight,
    this.memo,
    required this.createdAt,
  });

  final String id;
  final String date;
  final String workoutId;
  final String workoutName;
  final String category;
  final bool isCompleted;
  final int? sets;
  final int? reps;
  final double? weight;
  final String? memo;
  final DateTime createdAt;

  WorkoutLog copyWith({
    String? id,
    String? date,
    String? workoutId,
    String? workoutName,
    String? category,
    bool? isCompleted,
    int? sets,
    int? reps,
    double? weight,
    String? memo,
    DateTime? createdAt,
  }) {
    return WorkoutLog(
      id: id ?? this.id,
      date: date ?? this.date,
      workoutId: workoutId ?? this.workoutId,
      workoutName: workoutName ?? this.workoutName,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      memo: memo ?? this.memo,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class WorkoutLogAdapter extends TypeAdapter<WorkoutLog> {
  @override
  final int typeId = 1;

  @override
  WorkoutLog read(BinaryReader reader) {
    return WorkoutLog(
      id: reader.readString(),
      date: reader.readString(),
      workoutId: reader.readString(),
      workoutName: reader.readString(),
      category: reader.readString(),
      isCompleted: reader.readBool(),
      sets: reader.read() as int?,
      reps: reader.read() as int?,
      weight: reader.read() as double?,
      memo: reader.read() as String?,
      createdAt: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutLog obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.date);
    writer.writeString(obj.workoutId);
    writer.writeString(obj.workoutName);
    writer.writeString(obj.category);
    writer.writeBool(obj.isCompleted);
    writer.write(obj.sets);
    writer.write(obj.reps);
    writer.write(obj.weight);
    writer.write(obj.memo);
    writer.writeInt(obj.createdAt.millisecondsSinceEpoch);
  }
}
