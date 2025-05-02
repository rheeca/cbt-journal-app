import 'package:logger/logger.dart';

var logger = Logger(filter: NoFilter());

class NoFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
