import 'package:colartive2/features/canvas/views/canvas_live/canvas_live_controller.dart';
import 'package:colartive2/features/template/views/template_controller.dart';
import 'package:colartive2/routes/app_navigation.dart';
import 'package:colartive2/utils/core/app_sizes.dart';
import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../utils/components/fields/custom_email_field.dart';
import '../../../../../utils/components/fields/custom_password_field.dart';
import '../../../../../utils/components/fields/custom_text_form_field.dart';
import '../../../../../utils/components/scaffolds/form_scaffold.dart';
import '../../../../../utils/core/text_validator.dart';
import '../../../data/utils/auth_error_handler.dart';
import '../canvas_live/components/canvas/template_painter.dart';
import 'signup_controller.dart';

class CanvasShareView extends HookConsumerWidget {
  final String templateId;
  const CanvasShareView({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTemplate = ref.watch(templateDetailProvider(templateId));
    final variation = ref.watch(canvasLiveControllerProvider);

    final state = ref.watch(signupControllerProvider);

    final textController = useTextEditingController();

    ref.listen<AsyncValue>(
      signupControllerProvider,
      (prev, next) {
        if (!next.isRefreshing && next.hasError) {
          AuthErrorHandler.handleError(context, next.error!);
        } else if (!next.isRefreshing && next.hasValue) {
          if (redirect != null) {
            context.go(redirect!);
          } else {
            context.goHome();
          }
        }
      },
    );

    final canvasSize = Size(
      MediaQuery.of(context).size.width * 0.5,
      MediaQuery.of(context).size.height * 0.5,
    );
    const spacer = SizedBox(height: Paddings.md);
    return FormScaffold(
      title: AppStrings.signupTitle,
      isLoading: state.isLoading,
      isUpdateForm: false,
      onSubmitted: () {
        ref.read(signupControllerProvider.notifier).signup(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              name: nameController.text.trim(),
            );
      },
      children: [
        RepaintBoundary(
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
        spacer,
        TextFormField(
          controller: textController,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 50,
          maxLength: 999,
          decoration: const InputDecoration(
            hintText: 'Share your creative thoughts...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
