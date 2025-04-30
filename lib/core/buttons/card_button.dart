import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    required this.cardButtonData,
    super.key,
  });

  final CardButtonData cardButtonData;

  Widget customText(BuildContext context) => Center(
        child: Text(
          cardButtonData.title.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(cardButtonData.route);
      },
      child: Card(
        elevation: 5,
        color: cardButtonData.imagePath == null ? Colors.blueGrey : null,
        child: Container(
          decoration: BoxDecoration(
            image: cardButtonData.imagePath != null
                ? DecorationImage(
                    image: AssetImage(cardButtonData.imagePath!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: customText(context),
        ),
      ),
    );
  }
}

class CardButtonData {
  CardButtonData({
    required this.title,
    required this.route,
    String? imagePath,
  }) : imagePath = imagePath?.isEmpty ?? true ? null : imagePath;

  final String title;
  final String route;
  final String? imagePath;
}
