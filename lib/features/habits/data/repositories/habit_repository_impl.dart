import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final SharedPreferences preferences;

  HabitRepositoryImpl(this.preferences);

  static const String habitsKey = 'habits';

  @override
  Future<List<Habit>> getHabits() async {
    final data = preferences.getString(habitsKey);

    if (data == null) {
      return [
        const Habit(id: '1', name: 'Code', icon: '💻'),
        const Habit(id: '2', name: 'Read', icon: '📚'),
        const Habit(id: '3', name: 'Rest', icon: '😴'),
      ];
    }

    final List<dynamic> jsonList = jsonDecode(data);

    return jsonList.map((json) => HabitModel.fromJson(json)).toList();
  }

  @override
  Future<void> saveHabits(List<Habit> habits) async {
    final models = habits.map((habit) => HabitModel.fromHabit(habit)).toList();

    final jsonList = models.map((habit) => habit.toJson()).toList();

    await preferences.setString(habitsKey, jsonEncode(jsonList));
  }
}
