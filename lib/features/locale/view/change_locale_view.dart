import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      noPadding: true,
      title: AppStrings.language,
      child: RadioGroup<Locale>(
        groupValue: state,
        onChanged: (value) {
          onChanged(ref, value);
        },
        child: ListView.separated(
          itemCount: languages.length,
          itemBuilder: (context, index) => RadioListTile<Locale>(
            value: languages[index].locale,
            title: Text(languages[index].name),
            subtitle: Text(
                "${languages[index].locale.languageCode} ${languages[index].locale.countryCode ?? ''}"),
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
