import 'package:colartive2/core_packages.dart';
import 'package:colartive2/utils/components/buttons/custom_filled_button.dart';

import '../scaffolds/base_scaffold.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Error 404!',
      centerTitle: true,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: Column(
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
                onPressed: () => context.goNamed(RouteNames.home),
              )
            ],
          ),
        ),
      ),
    );
  }
}
