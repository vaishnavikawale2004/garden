import '../../domain/entities/habit.dart';

class HabitModel extends Habit {
  const HabitModel({
    required super.id,
    required super.name,
    required super.icon,
    super.wateredCount = 0,
  });

  factory HabitModel.fromHabit(Habit habit) {
    return HabitModel(
      id: habit.id,
      name: habit.name,
      icon: habit.icon,
      wateredCount: habit.wateredCount,
    );
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      wateredCount: json['wateredCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'icon': icon, 'wateredCount': wateredCount};
  }
}
