import 'package:flutter/material.dart';
import 'package:foot_app/core/buttons/icon_button.dart';
import 'package:foot_app/core/buttons/primary_button.dart';
import 'package:foot_app/core/dropdown/custom_dropdown.dart';
import 'package:foot_app/core/page_titles/page_titles.dart';
import 'package:foot_app/core/text/custom_texts.dart';
import 'package:foot_app/core/textfield/custom_text_field.dart';
import 'package:foot_app/core/utils/default_app_shadow.dart';

class NewShiftPage extends StatelessWidget {
  const NewShiftPage({super.key});

  // TODO(any): Add translations

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageTitles(pageTitle: 'New Shift'),
        Row(
          children: [
            Expanded(
              child: Column(
                children: dropdownWithTitle(
                  'Select Pitch:',
                  context,
                  const [
                    DropdownMenuItem(value: 1, child: Text('Cancha 1')),
                  ],
                  (value) {},
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: dropdownWithTitle(
                  'Shift duration:',
                  context,
                  const [
                    DropdownMenuItem(value: 1, child: Text('60 Min')),
                  ],
                  (value) {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            onPressed: () {},
            text: 'Pick schedule',
            trailingIcon: Icons.schedule,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: defaultAppShadow,
          ),
          child: SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Cliente',
                    suffixIcon: CustomIconButton(
                      icon: Icons.person,
                      onPressed: () {},
                      iconColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> dropdownWithTitle(
  String title,
  BuildContext context,
  List<DropdownMenuItem<int>> dropDownItems,
  ValueChanged<int?> onChanged,
) {
  return [
    Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6, left: 2),
      child: Row(
        children: [
          largeText(title, context),
        ],
      ),
    ),
    CustomDropdown(
      items: dropDownItems,
      value: 1,
      onChanged: onChanged,
    ),
  ];
}
