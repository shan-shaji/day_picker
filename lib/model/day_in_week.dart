class DayInWeek {
  String dayName;
  bool isSelected = false;
  DayInWeek(this.dayName);

  void toggleIsSelected() {
    this.isSelected = !this.isSelected;
  }
}
