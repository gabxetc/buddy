import 'package:logger/logger.dart';

class BLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    // Customise the log levels based on my needs
    level: Level.debug,
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}
