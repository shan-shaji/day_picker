import 'package:flutter/material.dart';
import 'package:day_picker/model/day_in_week.dart';

class SelectWeekDays extends StatefulWidget {
  // [onSelect] callBack to handle the Selected days
  final Function onSelect;

  // [backgroundColor] - property to change the color of the container.
  final Color? backgroundColor,
      // [daysFillColor] -  property to change the button color of days when the button is pressed.
      daysFillColor,
      // [daysBorderColor] - property to change the bordercolor of the rounded buttons.
      daysBorderColor,
      // [selectedDayTextColor] - property to change the color of text when the day is selected.
      selectedDayTextColor,
      // [unSelectedDayTextColor] - property to change the text color when the day is not selected.
      unSelectedDayTextColor;

// [border] Boolean to handle the day button border by default the border will be true.
  final bool border;

// [boxDecoration] to handle the decoration of the container.
  final BoxDecoration? boxDecoration;
// [padding] property  to handle the padding between the container and buttons by default it is 8.0
  final double padding;
  SelectWeekDays({
    required this.onSelect,
    this.backgroundColor,
    this.daysFillColor,
    this.daysBorderColor,
    this.selectedDayTextColor,
    this.unSelectedDayTextColor,
    this.border = true,
    this.boxDecoration,
    this.padding = 8.0,
    Key? key,
  }) :
        super(key: key);

  @override
  _SelectWeekDaysState createState() => _SelectWeekDaysState();
}

class _SelectWeekDaysState extends State<SelectWeekDays> {
  // list to insert the selected days.
  List<String> selectedDays = [];

  // list of days in a week.
  List<DayInWeek> _days = [
    DayInWeek(
      "Sunday",
    ),
    DayInWeek(
      "Monday",
    ),
    DayInWeek(
      "Tuesday",
    ),
    DayInWeek(
      "Wednesday",
    ),
    DayInWeek(
      "Thursday",
    ),
    DayInWeek(
      "Friday",
    ),
    DayInWeek(
      "Saturday",
    ),
  ];

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

  //  Handles color of widgets.

// getter to handle background color of container.
  Color? get _handleBackgroundColor {
    if (widget.backgroundColor == null) {
      return Theme.of(context).accentColor;
    } else {
      return widget.backgroundColor;
    }
  }

// getter to handle fill color of buttons.
  Color? get _handleDaysFillColor {
    if (widget.daysFillColor == null) {
      return Colors.white;
    } else {
      return widget.daysFillColor;
    }
  }

//getter to handle border color of days[buttons].
  Color? get _handleBorderColorOfDays {
    if (widget.daysBorderColor == null) {
      return Colors.white;
    } else {
      return widget.daysBorderColor;
    }
  }

// Handler to change the text color when the button is pressed and not pressed.
  Color? _handleTextColor(bool onSelect) {
    if (onSelect == true) {
      if (widget.selectedDayTextColor == null) {
        return Colors.black;
      } else {
        return widget.selectedDayTextColor;
      }
    } else if (onSelect == false) {
      if (widget.unSelectedDayTextColor == null) {
        return Colors.white;
      } else {
        return widget.unSelectedDayTextColor;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: _days.map(
            (day) {
              return Expanded(
                child: RawMaterialButton(
                  fillColor:
                      day.isSelected == true ? _handleDaysFillColor : null,
                  shape: CircleBorder(
                    side: widget.border
                        ? BorderSide(
                            color: _handleBorderColorOfDays!,
                            width: 2.0,
                          )
                        : BorderSide.none,
                  ),
                  onPressed: () {
                    setState(() {
                      day.toggleIsSelected();
                    });
                    _getSelectedWeekDays(day.isSelected, day.dayName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      day.dayName.substring(0, 3),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
