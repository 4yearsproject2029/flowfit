import 'package:hive/hive.dart';

class Workout {
  const Workout({
    required this.id,
    required this.name,
    required this.category,
    required this.isCompleted,
    required this.date,
  });

  final String id;
  final String name;
  final String category;
  final bool isCompleted;
  final DateTime date;
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
      isCompleted: reader.readBool(),
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.category);
    writer.writeBool(obj.isCompleted);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
  }
}
