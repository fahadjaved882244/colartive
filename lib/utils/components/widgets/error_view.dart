import 'package:colartive2/core_packages.dart';
import 'package:colartive2/utils/components/buttons/custom_filled_button.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Paddings.sm),
          CustomFilledButton(
            isTonal: true,
            text: 'Back to home',
            onPressed: () => context.go(AppPaths.home),
          )
        ],
      ),
    );
  }
}
