import 'package:flutter/material.dart';

class CustomTileDivider extends StatelessWidget {
  const CustomTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: 60,
      thickness: 0.5,
    );
  }
}
