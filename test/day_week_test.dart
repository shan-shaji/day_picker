import 'dart:math';

import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('By default isSelected will be false', () {
    DayInWeek s = DayInWeek('Tuesday');

    expect(s.isSelected, false);
    expect(s.dayName, 'Tuesday');
  });
}
