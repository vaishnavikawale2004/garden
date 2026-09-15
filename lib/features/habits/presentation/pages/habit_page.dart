import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/habit_bloc.dart';
import '../bloc/habit_event.dart';
import '../bloc/habit_state.dart';
import '../widgets/habit_card.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 228, 233),

      body: SafeArea(
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70),

                    const Text(
                      'Habit Garden 🌱',
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 49, 49),
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Water your habits daily and watch them grow!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 29, 26, 26),
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.habits.map((habit) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: HabitCard(
                            habit: habit,
                            onWater: () {
                              context.read<HabitBloc>().add(WaterHabit(habit));
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
