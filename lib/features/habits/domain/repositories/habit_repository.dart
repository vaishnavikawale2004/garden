import '../entities/habit.dart';

abstract class HabitRepository {
  Future<List<Habit>> getHabits();

  Future<void> saveHabits(List<Habit> habits);
}
