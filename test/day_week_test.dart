import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('By default isSelected will be false', () {
    final s = DayInWeek('Tuesday', dayKey: 'tuesday');

    expect(s.isSelected, false);
    expect(s.dayName, 'Tuesday');
  });

  test('when called toggleSelected `false` will become `true`', () {
    final s = DayInWeek('Tuesday', dayKey: 'tuesday');

    expect(s.isSelected, false);
    s.toggleIsSelected();
    expect(s.isSelected, true);
  });
}
