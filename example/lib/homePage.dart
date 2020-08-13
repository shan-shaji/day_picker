import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';

class HomePage extends StatelessWidget {
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
            child: WeekDayPicker(
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WeekDayPicker(
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
            child: WeekDayPicker(
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
          WeekDayPicker(
            backgroundColor: Color(0xFF303030),
            onSelect: (values) {
              print(values);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WeekDayPicker(
              border: false,
              backgroundColor: Color(0xFF303030),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WeekDayPicker(
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
