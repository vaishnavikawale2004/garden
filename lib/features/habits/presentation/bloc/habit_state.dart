import '../../domain/entities/habit.dart';

class HabitState {
  final List<Habit> habits;
  final bool isLoading;

  const HabitState({this.habits = const [], this.isLoading = false});

  HabitState copyWith({List<Habit>? habits, bool? isLoading}) {
    return HabitState(
      habits: habits ?? this.habits,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
