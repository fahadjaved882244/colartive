import 'package:colartive2/utils/core/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/components/scaffolds/base_scaffold.dart';
import 'components/login_form_card.dart';
import 'components/external_login_card.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: AppStrings.loginTitle,
      noPadding: false,
      isCancel: true,
      child: ListView(
        children: [
          const ExternalLoginCard(),
          LoginFormCard(),
        ],
      ),
    );
  }
}
