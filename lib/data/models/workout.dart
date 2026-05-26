import 'package:hive/hive.dart';

class Workout {
  const Workout({
    required this.id,
    required this.name,
    required this.category,
    this.description,
    this.defaultSets,
    this.defaultReps,
  });

  final String id;
  final String name;
  final String category;
  final String? description;
  final int? defaultSets;
  final int? defaultReps;
}

class WorkoutAdapter extends TypeAdapter<Workout> {
  @override
  final int typeId = 0;

  @override
  Workout read(BinaryReader reader) {
    return Workout(
      id: reader.readString(),
      name: reader.readString(),
      category: reader.readString(),
      description: reader.read() as String?,
      defaultSets: reader.read() as int?,
      defaultReps: reader.read() as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.category);
    writer.write(obj.description);
    writer.write(obj.defaultSets);
    writer.write(obj.defaultReps);
  }
}
