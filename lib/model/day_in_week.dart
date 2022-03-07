class DayInWeek {
  String dayName;
  String dayKey;
  bool isSelected = false;

  DayInWeek(this.dayName, {required this.dayKey, this.isSelected = false});

  void toggleIsSelected() {
    this.isSelected = !this.isSelected;
  }
}
