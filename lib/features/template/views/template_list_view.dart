import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemplateListView extends ConsumerWidget {
  const TemplateListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplates = ref.watch(templateListProvider);
    return AsyncValueBuilder(
      asyncValue: asyncTemplates,
      builder: (templates) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Templates'),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: templates.length,
              itemBuilder: (context, index) {
                final item = templates[index];
                return ListTile(
                  title: Text(item.name),
                  onTap: () {
                    context.goNamed(
                      RouteNames.canvasLive,
                      pathParameters: {'templateId': item.fontFamily},
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
