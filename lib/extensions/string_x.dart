import 'package:flutter/material.dart';

class RoutingData {
  final String route;
  final Map<String, String> queryParameters;

  RoutingData({required this.route, required this.queryParameters});

  String? operator [](String key) => queryParameters[key];
}

extension StringX on String {
  RoutingData get getRountingData {
    final uriData = Uri.parse(this);
    return RoutingData(
      route: uriData.path,
      queryParameters: uriData.queryParameters,
    );
  }

  bool get parseBool {
    return toLowerCase() == 'true';
  }

  String get spaceCase {
    List<String> list = split("");
    int index = 0;
    index = list.indexWhere((element) => element.contains(RegExp(r'[A-Z]')));
    if (index != -1) list.insert(index, " ");
    return list.join();
  }

  String get capFirst {
    List<String> capWords = [];
    List<String> words = trim().replaceAll("_", "").split(" ");
    for (final word in words) {
      final alphabets = word.split("");
      alphabets[0] = alphabets[0].toUpperCase();
      capWords.add(alphabets.join());
    }
    return capWords.isNotEmpty ? capWords.join(" ") : this;
  }

  String? get nullIfEmpty {
    return isEmpty ? null : this;
  }

  double get zeroIfEmpty {
    return isEmpty ? double.parse("0") : double.parse(this);
  }

  TimeOfDay get parseToTime {
    final saperated = split(":");
    return TimeOfDay(
      hour: int.parse(saperated[0]),
      minute: int.parse(saperated[1]),
    );
  }

  List<TextSpan> highlightOccurrences(String? query) {
    final source = this;
    if (query == null ||
        query.isEmpty ||
        !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
