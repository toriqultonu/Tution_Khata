class WeekDays {
  String dayName;
  String id;
  bool isSelected = false;

  WeekDays({required this.dayName, required this.id, this.isSelected = false});

  void toggleIsSelected() {
    this.isSelected = !this.isSelected;
  }
}