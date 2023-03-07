import 'package:colartive2/core_packages.dart';

class CustomDividerText extends StatelessWidget {
  final String text;
  const CustomDividerText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Paddings.sm),
          child: CustomText(
            text,
            style: context.textTheme.labelSmall,
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
