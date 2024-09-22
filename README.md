# Day Picker

A Flutter widget library which helps us to select days in a week.

[![Test, Build and deploy](https://github.com/shan-shaji/day_picker/actions/workflows/main.yaml/badge.svg)](https://github.com/shan-shaji/day_picker/actions/workflows/main.yaml)
[![Build Status](https://app.bitrise.io/app/013db1e886b74200/status.svg?token=_0SuAtQgrBJ6mbmaQ6_7YA&branch=master)](https://app.bitrise.io/app/013db1e886b74200)
[![likes](https://img.shields.io/pub/likes/day_picker)](https://pub.dev/packages/day_picker)
[![popularity](https://img.shields.io/pub/popularity/day_picker)](https://pub.dev/packages/day_picker/score)
[![pub points](https://img.shields.io/pub/points/day_picker)](https://pub.dev/packages/day_picker/score)
## Screenshot

<p>
<img src="https://raw.githubusercontent.com/shan-shaji/day_picker/master/screenshots/screenshot.jpg" alt="Screenshot week day picker" width="250">
<img src="https://raw.githubusercontent.com/shan-shaji/day_picker/master/screenshots/animate.gif" alt="Screenshot week day picker" width="250">
</p>

## Usage

Add `day_picker` to your `pubspec.yaml` file.

```dependencies:
    flutter:
      sdk: flutter
    day_picker: 2.3.0
```

import the package:

```dart
import 'package:day_picker/day_picker.dart';
```

Constructor for the `day_picker` is given below.

```dart
      const SelectWeekDays({
        required this.onSelect,
        required this.days,
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
        this.elevation = 2.0,
        super.key,
      });
```

Example here creates a `day_picker` with below style [with Gradient and no borders].

<img src="https://raw.githubusercontent.com/shan-shaji/day_picker/master/screenshots/screenshot2.jpg" alt="Screenshot week day picker" width="250">

```dart

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Select days in week"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectWeekDays(
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
          ),
        ),
      ),
    );
  }
```

Pass a callback to the `onSelect` property with parameter of type `List<String>`.

---

Pass a list of days of type `DayInWeek` into `days` property

```dart
class DayInWeek {
  DayInWeek(
      this.dayName, {
        required this.dayKey,
        this.isSelected = false,
      });

  String dayName;
  String dayKey;
  bool isSelected = false;
}
```

`DayInWeek` consist of three Properties [dayName], [dayKey] and [isSelected].
By default [isSelected] value will be `false`

---

Example:

```dart
void handleOnSelect(List<String> days){
    //TODO: Manipulate the List of days selected
    print(days);
}
```

## Customization

| Property               | Type            | Description                                                                                                          |
| ---------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------- |
| onSelect               | List`<String>`  | Callback invoked when days are selected                                                                              |
| days |   List`<DayInWeek>` | List of days that need to be passed
| padding                | `double`        | Padding between container and the buttons [by default it is 8.0]                                                     |
| boxdecoration          | `BoxDecoration` | provides variety of ways to style the background container[gradient, color, border radius]                           |
| backgroundColor        | `Color`         | Property to change the color of the container                                                                        |
| fontSize               | `double`     | Property to change size of font                                                                     |
| fontWeight             | `FontWeight`    | Property to change the font weight of text                                             |
| daysFillColor          | `Color`         | Property to change the color of rounded buttons when the days are selected                                           |
| daysBorderColor        | `Color`         | Property to change the border color of rounded button                                                                |
| selectedDayTextColor   | `Color`         | property to change the text color of the selected days                                                               |
| unSelectedDayTextColor | `Color`         | property to change the text color when the days are not selected                                                     |
| border                 | `bool`          | Set this property to false if border is not needed around the rounded buttons[by default this property will be true] |

With the implementation of the `setDaysState` method, developers can dynamically modify which days are selected within their application's code, even after the `SelectWeekDays` widget has already been constructed. 
By utilizing the Global Key that is passed into the widget, one can easily update the selected dates as desired.


## Contributions
Contributions of any kind are more than welcome😊! Feel free to fork and improve `day_picker` or open an issue.
