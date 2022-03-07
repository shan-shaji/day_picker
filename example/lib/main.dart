import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<DayInWeek> _days = [
    DayInWeek(
      "Zo",
      "monday"
    ),
    DayInWeek(
      "Ma",
      "tuesday"
    ),
    DayInWeek(
      "Di",
      "wednesday"
    ),
    DayInWeek(
      "Wo",
      "thursday"
    ),
    DayInWeek(
      "Do",
      "friday"
    ),
    DayInWeek("Vr", "saturday",isSelected: true),
    DayInWeek("Za", "sunday", isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select days in week"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFFE55CE4), const Color(0xFFBB75FB)], // whitish to gray
                  tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFFE55CE4), const Color(0xFFBB75FB)], // whitish to gray
                  tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          SelectWeekDays(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            days: _days,
            backgroundColor: Color(0xFF303030),
            onSelect: (values) {
              print(values);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              backgroundColor: Color(0xFF303030),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              boxDecoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
        ],
      ),
    );
  }
}
