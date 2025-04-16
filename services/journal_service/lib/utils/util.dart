import 'package:fixnum/fixnum.dart';
import 'package:journal_service/generated/models.dart';

extension DateTimeToTimestamp on DateTime {
  Timestamp toProtoTimestamp() {
    return Timestamp()
      ..seconds = Int64(millisecondsSinceEpoch ~/ 1000)
      ..nanos = (microsecond * 1000) % 1000000000;
  }
}
