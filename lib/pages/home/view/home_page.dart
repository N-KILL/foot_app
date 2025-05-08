import 'package:flutter/material.dart';
import 'package:foot_app/core/buttons/card_button.dart';
import 'package:foot_app/l10n/arb/app_localizations.dart';
import 'package:foot_app/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final itemList = getItems(l10n);
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: screenSize.height / 2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: itemList.length,
            itemBuilder: (context, index) => CardButton(
              cardButtonData: itemList[index],
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          child: Center(
            child: Text('- ${l10n.appName} -'),
          ),
        ),
      ],
    );
  }
}

List<CardButtonData> getItems(AppLocalizations l10n) {
  final selectedDay = DateTime.now();
  return [
    CardButtonData(
      title: l10n.newShiftButtonText,
      imagePath: '',
      route: '/new_shift/',
    ),
    CardButtonData(
      title: l10n.shiftButtonText,
      imagePath: '',
      route: '/shifts_details/${selectedDay.toIso8601String()}',
    ),
    CardButtonData(
      title: l10n.customizeButtonText,
      imagePath: '',
      route: '/shifts_details/${selectedDay.toIso8601String()}',
    ),
    CardButtonData(
      title: l10n.configButtonText,
      imagePath: '',
      route: '/shifts_details/${selectedDay.toIso8601String()}',
    ),
  ];
}
