class DayInWeek {
  DayInWeek(
    this.dayName, {
    required this.dayKey,
    this.isSelected = false,
  });

  String dayName;
  String dayKey;
  bool isSelected = false;

  void toggleIsSelected() {
    isSelected = !isSelected;
  }
}
