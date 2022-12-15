import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  String get formatted {
    final hour = this.hour;
    final minute = this.minute;
    if (hour < 12) {
      return "${hour < 10 ? "0$hour" : "$hour"}:${minute < 10 ? "0$minute" : "$minute"} AM";
    } else {
      return "${(hour % 12) < 10 ? "0${hour % 12}" : "${hour % 12}"}:${minute < 10 ? "0$minute" : "$minute"} PM";
    }
  }

  double get toDouble {
    return hour + minute / 60.0;
  }
}
