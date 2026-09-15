import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection.dart';
import 'features/habits/domain/repositories/habit_repository.dart';
import 'features/habits/presentation/bloc/habit_bloc.dart';
import 'features/habits/presentation/bloc/habit_event.dart';
import 'features/habits/presentation/pages/habit_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const HabitGardenApp());
}

class HabitGardenApp extends StatelessWidget {
  const HabitGardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitBloc(getIt<HabitRepository>())..add(LoadHabits()),

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HabitPage(),
      ),
    );
  }
}
