import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';

class SelectWeekDays extends StatefulWidget {
  /// [onSelect] callBack to handle the Selected days
  final Function onSelect;

  /// List of days of type `DayInWeek`
  final List<DayInWeek> days;

  /// [backgroundColor] - property to change the color of the container.
  final Color? backgroundColor;

  /// [fontWeight] - property to change the weight of selected text
  final FontWeight? fontWeight;

  /// [fontSize] - property to change the size of selected text
  final double? fontSize;

  /// [selectedDaysFillColor] -  property to change the button color of days when the button is selected.
  final Color? selectedDaysFillColor;

  /// [unselectedDaysFillColor] -  property to change the button color of days when the button is not selected.
  final Color? unselectedDaysFillColor;

  /// [selectedDaysBorderColor] - property to change the border color of the rounded buttons when day is selected.
  final Color? selectedDaysBorderColor;

  /// [unselectedDaysBorderColor] - property to change the border color of the rounded buttons when day is unselected.
  final Color? unselectedDaysBorderColor;

  /// [selectedDayTextColor] - property to change the color of text when the day is selected.
  final Color? selectedDayTextColor;

  /// [unSelectedDayTextColor] - property to change the text color when the day is not selected.
  final Color? unSelectedDayTextColor;

  /// [border] Boolean to handle the day button border by default the border will be true.
  final bool border;

  /// [boxDecoration] to handle the decoration of the container.
  final BoxDecoration? boxDecoration;

  /// [padding] property  to handle the padding between the container and buttons by default it is 8.0
  final double padding;

  /// The property that can be used to specify the [width] of the [SelectWeekDays] container.
  /// By default this property will take the full width of the screen.
  final double? width;

  /// [borderWidth] property  to handle the width border of the container by default it is 2.0
  final double? borderWidth;

  /// [elevation] property  to change the elevation of  RawMaterialButton  by default it is 2.0
  final double? elevation;

  /// `SelectWeekDays` takes a list of days of type `DayInWeek`.
  /// `onSelect` property will return `list` of days that are selected.
  SelectWeekDays({
    required this.onSelect,
    this.backgroundColor,
    this.fontWeight,
    this.fontSize,
    this.selectedDaysFillColor,
    this.unselectedDaysFillColor,
    this.selectedDaysBorderColor,
    this.unselectedDaysBorderColor,
    this.selectedDayTextColor,
    this.unSelectedDayTextColor,
    this.border = true,
    this.boxDecoration,
    this.padding = 8.0,
    this.width,
    this.borderWidth,
    this.elevation,
    required this.days,
    super.key,
  });

  @override
  SelectWeekDaysState createState() => SelectWeekDaysState(days);
}

class SelectWeekDaysState extends State<SelectWeekDays> {
  SelectWeekDaysState(List<DayInWeek> days) : _daysInWeek = days;

  // list to insert the selected days.
  List<String> selectedDays = [];

  // list of days in a week.
  List<DayInWeek> _daysInWeek = [];

  @override
  void initState() {
    _daysInWeek.forEach((element) {
      if (element.isSelected) {
        selectedDays.add(element.dayKey);
      }
    });
    super.initState();
  }

  /// Set days to new value
  void setDaysState(List<DayInWeek> newDays) {
    selectedDays = [];
    for (DayInWeek dayInWeek in newDays) {
      if (dayInWeek.isSelected) {
        selectedDays.add(dayInWeek.dayKey);
      }
    }
    setState(() {
      _daysInWeek = newDays;
    });
  }

  void _getSelectedWeekDays(bool isSelected, String day) {
    if (isSelected == true) {
      if (!selectedDays.contains(day)) {
        selectedDays.add(day);
      }
    } else if (isSelected == false) {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      }
    }
    // [onSelect] is the callback which passes the Selected days as list.
    widget.onSelect(selectedDays.toList());
  }

// getter to handle background color of container.
  Color? get _handleBackgroundColor {
    if (widget.backgroundColor == null) {
      return Theme.of(context).colorScheme.secondary;
    } else {
      return widget.backgroundColor;
    }
  }

// getter to handle fill color of buttons.
  Color? _handleDaysFillColor(bool onSelect) {
    if (!onSelect && widget.unselectedDaysFillColor == null) {
      return null;
    }

    return selectedUnselectedLogic(
      onSelect: onSelect,
      selectedColor: widget.selectedDaysFillColor,
      unSelectedColor: widget.unselectedDaysFillColor,
      defaultSelectedColor: Colors.white,
      defaultUnselectedColor: Colors.white,
    );
  }

//getter to handle border color of days[buttons].
  Color _handleBorderColorOfDays(bool onSelect) {
    return selectedUnselectedLogic(
      onSelect: onSelect,
      selectedColor: widget.selectedDaysBorderColor,
      unSelectedColor: widget.unselectedDaysBorderColor,
      defaultSelectedColor: Colors.white,
      defaultUnselectedColor: Colors.white,
    );
  }

// Handler to change the text color when the button is pressed and not pressed.
  Color? _handleTextColor(bool onSelect) {
    return selectedUnselectedLogic(
      onSelect: onSelect,
      selectedColor: widget.selectedDayTextColor,
      unSelectedColor: widget.unSelectedDayTextColor,
      defaultSelectedColor: Colors.black,
      defaultUnselectedColor: Colors.white,
    );
  }

  Color selectedUnselectedLogic({
    required bool onSelect,
    required Color? selectedColor,
    required Color? unSelectedColor,
    required Color defaultSelectedColor,
    required Color defaultUnselectedColor,
  }) {
    if (onSelect) {
      return selectedColor != null ? selectedColor : defaultSelectedColor;
    }
    return unSelectedColor != null ? unSelectedColor : defaultUnselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      decoration: widget.boxDecoration == null
          ? BoxDecoration(
              color: _handleBackgroundColor,
              borderRadius: BorderRadius.circular(0),
            )
          : widget.boxDecoration,
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _daysInWeek.map(
            (day) {
              return Expanded(
                child: RawMaterialButton(
                  fillColor: _handleDaysFillColor(day.isSelected),
                  shape: CircleBorder(
                    side: widget.border
                        ? BorderSide(
                            color: _handleBorderColorOfDays(day.isSelected),
                            width: widget.borderWidth ?? 2.0,
                          )
                        : BorderSide.none,
                  ),
                  elevation: widget.elevation ?? 2.0,
                  onPressed: () {
                    setState(() {
                      day.toggleIsSelected();
                    });
                    _getSelectedWeekDays(day.isSelected, day.dayKey);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      day.dayName.length < 3
                          ? day.dayName
                          : day.dayName.substring(0, 3),
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight,
                        color: _handleTextColor(day.isSelected),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
