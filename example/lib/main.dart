import 'package:day_picker/day_picker.dart';
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
  final List<DayInWeek> _days = [
    DayInWeek("Zo", dayKey: "monday"),
    DayInWeek("Ma", dayKey: "tuesday"),
    DayInWeek("Di", dayKey: "wednesday"),
    DayInWeek("Wo", dayKey: "thursday"),
    DayInWeek("Do", dayKey: "friday"),
    DayInWeek("Vr", dayKey: "saturday", isSelected: true),
    DayInWeek("Za", dayKey: "sunday", isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    final customWidgetKey = new GlobalKey<SelectWeekDaysState>();

    SelectWeekDays selectWeekDays = SelectWeekDays(
      key: customWidgetKey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      days: _days,
      border: false,
      width: MediaQuery.of(context).size.width / 1.4,
      boxDecoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30.0),
      ),
      onSelect: (values) {
        print(values);
      },
    );

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
              backgroundColor: Colors.blue,
              selectedDayTextColor: Colors.green,
              selectedDaysFillColor: Colors.red,
              unselectedDaysFillColor: Colors.brown,
              selectedDaysBorderColor: Colors.deepPurple,
              unselectedDaysBorderColor: Colors.yellow,
              unSelectedDayTextColor: Colors.pink,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              width: MediaQuery.of(context).size.width / 2,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFFE55CE4),
                    const Color(0xFFBB75FB)
                  ], // whitish to gray
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
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
                  colors: [
                    const Color(0xFFE55CE4),
                    const Color(0xFFBB75FB)
                  ], // whitish to gray
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectWeekDays,
              ),
              Container(
                color: Colors.green.withOpacity(0.4),
                child: TextButton(
                  onPressed: () {
                    List<DayInWeek> offAllDays =
                        List.from(_days.map((e) => e..isSelected = false));
                    customWidgetKey.currentState?.setDaysState(offAllDays);
                  },
                  child: Text('Days off'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
