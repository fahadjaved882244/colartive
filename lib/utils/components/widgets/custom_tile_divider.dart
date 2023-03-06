import 'package:flutter/material.dart';

class CustomTileDivider extends StatelessWidget {
  const CustomTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: 52,
      thickness: 0.5,
    );
  }
}
