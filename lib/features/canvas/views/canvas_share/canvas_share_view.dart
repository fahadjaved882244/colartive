import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import 'package:colartive2/extensions/string_x.dart';
import 'package:colartive2/features/auth/views/auth_controller.dart';
import 'package:colartive2/features/canvas/model/shared_variation.dart';
import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:colartive2/features/canvas/views/canvas_share/canvas_share_controller.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/routes/app_paths.dart';
import 'package:colartive2/utils/components/popups/custom_snackbar.dart';
import 'package:colartive2/utils/components/widgets/async_switcher.dart';
import 'package:colartive2/utils/core/app_sizes.dart';

import '../canvas_live/components/canvas/template_painter.dart';

class CanvasShareView extends HookConsumerWidget {
  final String templateId;
  const CanvasShareView({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplate = ref.watch(templateDetailProvider(templateId));
    final variation = ref.watch(canvasLiveControllerProvider);
    final user = ref.watch(authStateProvider);

    final state = ref.watch(canvasShareControllerProvider);

    final textController = useTextEditingController();
    final isPublic = useState(true);

    ref.listen<AsyncValue>(
      canvasShareControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          showCustomSnackBar(
              context, next.error?.toString() ?? 'Error occurred!');
        } else if (!next.isRefreshing && next.hasValue) {
          context.goHome();
        }
      },
    );

    final canvasSize = Size(
      MediaQuery.of(context).size.width * 0.45,
      MediaQuery.of(context).size.height * 0.45,
    );

    return AsyncValueBuilder(
        asyncValue: asyncTemplate,
        builder: (template) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: const Text('Share your Artwork'),
              leading: context.canPop()
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    )
                  : null,
              actions: [
                TextButton(
                  onPressed: !state.isLoading
                      ? () {
                          if (user == null) {
                            final redirect = Uri.parse(
                              "${AppPaths.canvasSharePath}?templateId=${template.fontFamily}",
                            ).toString();
                            context.goLogin(redirect);
                          } else {
                            ref
                                .read(canvasShareControllerProvider.notifier)
                                .share(
                                  variation: SharedVariation(
                                    id: Uuid().v4(),
                                    templateId: templateId,
                                    userId: user.id,
                                    variation: variation,
                                    description:
                                        textController.text.trim().nullIfEmpty,
                                    upvoteCount: 0,
                                    commentCount: 0,
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                    isPublic: isPublic.value,
                                  ),
                                );
                          }
                        }
                      : null,
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : Text(AppStrings.submit),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(Paddings.sm),
              child: Column(
                children: [
                  SizedBox.fromSize(
                    size: canvasSize,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Corners.crd),
                      child: RepaintBoundary(
                        child: CustomPaint(
                          size: canvasSize,
                          willChange: false,
                          painter: TemplatePainter(
                            variation: variation,
                            template: template,
                            hintIndex: null,
                            hintOpacity: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Paddings.sm),
                  // SwitchListTile.adaptive(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(Corners.tf),
                  //     side: BorderSide(width: 1),
                  //   ),
                  //   title: const Text('Make it Public'),
                  //   value: isPublic.value,
                  //   onChanged: (value) => isPublic.value = value,
                  // ),
                  // spacer,
                  TextFormField(
                    controller: textController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 999,
                    decoration: const InputDecoration(
                      hintText: 'Describe your creative thoughts...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
