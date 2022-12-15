import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  const EmptyView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
