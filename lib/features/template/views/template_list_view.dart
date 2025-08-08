import 'package:colartive2/features/template/views/components/template_thumbnail.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemplateListView extends ConsumerWidget {
  const TemplateListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplates = ref.watch(templateListProvider);
    return AsyncValueBuilder(
      asyncValue: asyncTemplates,
      builder: (templates) {
        final freeTemplates = templates.where((t) => !t.isPremium).toList();
        final premiumTemplates = templates.where((t) => t.isPremium).toList();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    hintText: "Search templates...",
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Free Templates",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: "Cinzel Decorative",
                        ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: freeTemplates.length,
                    itemBuilder: (context, index) {
                      final item = freeTemplates[index];
                      return TemplateThumbnail(template: item);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Premium Templates",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: "Cinzel Decorative",
                        ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: premiumTemplates.length,
                    itemBuilder: (context, index) {
                      final item = premiumTemplates[index];
                      return TemplateThumbnail(template: item);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
