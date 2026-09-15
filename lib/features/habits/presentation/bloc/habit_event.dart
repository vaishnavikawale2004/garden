import '../../domain/entities/habit.dart';

abstract class HabitEvent {}

class LoadHabits extends HabitEvent {}

class WaterHabit extends HabitEvent {
  final Habit habit;

  WaterHabit(this.habit);
}