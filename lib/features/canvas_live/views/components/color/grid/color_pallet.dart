import 'package:flutter/material.dart';

const List<ColorSwatch> colorSwatches = [
  Colors.grey,
  Colors.blueGrey,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
];

List<Color> getSwatchShades(ColorSwatch color) {
  return <Color>[
    if (color[100] != null)
      color == Colors.grey ? const Color(0xffffffff) : color[100]!,
    if (color[200] != null) color == Colors.grey ? color[100]! : color[200]!,
    if (color[300] != null) color[300]!,
    if (color[400] != null) color[400]!,
    if (color[500] != null) color[500]!,
    if (color[600] != null) color[600]!,
    if (color[700] != null) color[700]!,
    if (color[800] != null) color == Colors.grey ? color[900]! : color[800]!,
    if (color[900] != null)
      color == Colors.grey ? const Color(0xff000000) : color[900]!,
  ];
}
