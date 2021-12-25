import 'package:flutter/material.dart';
import '../../../../global/components/common/buttons.dart';
import '../../../../global/navigation/navigation.dart';
import '../../../settings/view_settings.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.settings),
      onPressed: () async => navigate(
        const SettingView(),
        context,
      ),
    );
  }
}
