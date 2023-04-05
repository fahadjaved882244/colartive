import 'package:logger/logger.dart';

class AppLogger {
  static final _lo = Logger(
    filter: MyFilter(),
    printer: PrettyPrinter(
        methodCount: 0, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 100, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  static d(message) => _lo.d(message);
  static v(message) => _lo.v(message);
  static i(message) => _lo.i(message);
  static w(message) => _lo.w(message);
  static e(message) => _lo.e(message);
  static wtf(message) => _lo.wtf(message);
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
    //    if(event.level == Level.error || event.level == Level.warning) {
    //    return true;
    //  }
  }
}
