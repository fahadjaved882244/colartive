import 'package:colartive2/core_packages.dart';
import 'package:colartive2/utils/components/cards/custom_outlined_card.dart';
import 'package:colartive2/utils/components/scaffolds/base_scaffold.dart';
import 'package:colartive2/features/locale/view/change_locale_controller.dart';

class ChangeLocaleView extends ConsumerWidget {
  const ChangeLocaleView({super.key});

  void onChanged(WidgetRef ref, Locale? value) {
    if (value != null) {
      ref.read(localeControllerProvider.notifier).setLocale(value);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localeControllerProvider);
    final languages =
        ref.read(localeControllerProvider.notifier).getSupportedLanguages();
    return BaseScaffold(
      title: AppStrings.language,
      child: ListView.separated(
        padding: const EdgeInsets.all(Paddings.xs),
        itemCount: languages.length,
        itemBuilder: (context, index) => CustomOutlinedCard(
          child: RadioListTile<Locale>(
            value: languages[index].locale,
            selected: state == languages[index].locale,
            groupValue: state,
            onChanged: (value) => onChanged(ref, value),
            title: Text(languages[index].name),
            subtitle: Text(
                "${languages[index].locale.languageCode} ${languages[index].locale.countryCode ?? ''}"),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(),
      ),
    );
  }
}
