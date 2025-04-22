import 'package:cbt_journal/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/fixnum.dart';

void updateOrAppend<T>(List<T> list, int index, T value) {
  if (index >= 0 && index < list.length) {
    list[index] = value;
  } else {
    list.add(value);
  }
}

T? getAtIndexOrNull<T>(List<T> list, int index) {
  return (index >= 0 && index < list.length) ? list[index] : null;
}

DateTime dateOnlyUtc(DateTime date) {
  date = date.toUtc();
  return DateTime.utc(date.year, date.month, date.day);
}

extension DateTimeToTimestamp on DateTime {
  Timestamp toProtoTimestamp() {
    return Timestamp()
      ..seconds = Int64(millisecondsSinceEpoch ~/ 1000)
      ..nanos = (microsecond * 1000) % 1000000000;
  }
}
