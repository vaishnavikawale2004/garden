import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/habit_repository.dart';
import 'habit_event.dart';
import 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final HabitRepository repository;

  HabitBloc(this.repository) : super(const HabitState()) {
    on<LoadHabits>(_loadHabits);
    on<WaterHabit>(_waterHabit);
  }

  Future<void> _loadHabits(LoadHabits event, Emitter<HabitState> emit) async {
    emit(state.copyWith(isLoading: true));

    final habits = await repository.getHabits();

    emit(state.copyWith(habits: habits, isLoading: false));
  }

  Future<void> _waterHabit(WaterHabit event, Emitter<HabitState> emit) async {
    final updatedHabits = state.habits.map((habit) {
      if (habit.id == event.habit.id) {
        return habit.copyWith(wateredCount: habit.wateredCount + 1);
      }

      return habit;
    }).toList();

    emit(state.copyWith(habits: updatedHabits));

    await repository.saveHabits(updatedHabits);
  }
}
