class DayInWeek {
  String dayName;
  String dayKey;
  bool isSelected = false;

  DayInWeek(this.dayName, this.dayKey,{this.isSelected = false});

  void toggleIsSelected() {
    this.isSelected = !this.isSelected;
  }
}
