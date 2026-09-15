import 'package:flutter/material.dart';

import '../../domain/entities/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  final VoidCallback onWater;

  const HabitCard({super.key, required this.habit, required this.onWater});

  String get plant {
    if (habit.wateredCount == 0) {
      return '🌰';
    } else if (habit.wateredCount < 5) {
      return '🌱';
    } else if (habit.wateredCount < 10) {
      return '🌿';
    } else if (habit.wateredCount < 15) {
      return '🪴';
    } else if (habit.wateredCount < 20) {
      return '🌳';
    } else if (habit.wateredCount < 25) {
      return '🌸';
    } else if (habit.wateredCount < 30) {
      return '🍇';
    } else {
      return '🌳';
    }
  }

  String get stage {
    if (habit.wateredCount == 0) {
      return 'Seed';
    } else if (habit.wateredCount < 5) {
      return 'Growing';
    } else if (habit.wateredCount < 10) {
      return 'Big Tree';
    } else {
      return 'Full Tree';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(plant, style: const TextStyle(fontSize: 65)),

        const SizedBox(height: 8),

        Text(
          habit.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        Text('Watered ${habit.wateredCount} times'),

        Text(stage, style: const TextStyle(fontSize: 14)),

        const SizedBox(height: 15),

        ElevatedButton(onPressed: onWater, child: const Text('Water 💦')),
      ],
    );
  }
}
