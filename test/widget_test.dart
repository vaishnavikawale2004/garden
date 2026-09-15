import 'package:flutter_test/flutter_test.dart';
import 'package:garden/main.dart';

void main() {
  testWidgets('Habit Garden app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitGardenApp());

    expect(find.text('Habit Garden 🌱'), findsOneWidget);
    expect(
      find.text('Water your habits daily and watch them grow!'),
      findsOneWidget,
    );
    expect(find.text('Code'), findsOneWidget);
    expect(find.text('Read'), findsOneWidget);
    expect(find.text('Rest'), findsOneWidget);
  });
}
