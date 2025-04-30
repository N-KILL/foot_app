import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Switch(
      activeColor: theme.onSecondary,
      inactiveThumbColor: theme.surface.withAlpha(100),
      trackColor: WidgetStatePropertyAll(theme.secondary),
      trackOutlineColor: WidgetStatePropertyAll(theme.secondary),
      value: value,
      onChanged: onChanged,
    );
  }
}
