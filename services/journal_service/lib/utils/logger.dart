import 'package:logger/logger.dart';

class NoFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
