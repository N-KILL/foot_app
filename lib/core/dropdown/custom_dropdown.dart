import 'package:flutter/material.dart';
import 'package:foot_app/core/colors.dart';
import 'package:foot_app/core/utils/default_app_shadow.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    required this.items,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final List<DropdownMenuItem<T>> items;
  final T value;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.surface,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: defaultAppShadow,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<T>(
        style: const TextStyle(color: appBlack, fontSize: 20),
        dropdownColor: Theme.of(context).colorScheme.onPrimary,
        iconEnabledColor: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
        isExpanded: true,
        value: value,
        onChanged: onChanged,
        items: items,
        underline: Container(),
      ),
    );
  }
}
