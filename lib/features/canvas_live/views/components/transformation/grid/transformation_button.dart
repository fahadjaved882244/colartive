import 'package:colartive2/extensions/context_x.dart';
import 'package:flutter/material.dart';

class TransformationButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String text;
  final Function() onTap;
  const TransformationButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height * 0.077,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.inverseSurface,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onInverseSurface,
                  size: 20,
                ),
              ),
              const SizedBox(height: 4),
              if (text != '')
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
