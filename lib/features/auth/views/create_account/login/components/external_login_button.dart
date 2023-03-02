import '../../../../../../../core_packages.dart';

class ExternalLoginButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onPressed;
  const ExternalLoginButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.secondaryContainer,
        borderRadius: BorderRadius.circular(Corners.rnd),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
    // InkWell(
    //   onTap: onTap,
    //   child: Chip(
    //     backgroundColor: context.colors.surface,
    //     shape: RoundedRectangleBorder(
    //       side: const BorderSide(color: AppColors.darkGray),
    //       borderRadius: BorderRadius.circular(Corners.btn),
    //     ),
    //     avatar: icon,
    //     label: Text(
    //       text,
    //       style: context.textTheme.labelLarge,
    //     ),
    //   ),
    // );
  }
}
