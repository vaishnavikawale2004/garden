class Habit {
  final String id;
  final String name;
  final String icon;
  final int wateredCount;

  const Habit({
    required this.id,
    required this.name,
    required this.icon,
    this.wateredCount = 0,
  });
  Habit copyWith({String? id, String? name, String? icon, int? wateredCount}) {
    return Habit(
      id: this.id,
      name: this.name,
      icon: this.icon,
      wateredCount: wateredCount ?? this.wateredCount,
    );
  }
}
