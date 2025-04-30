import 'package:flutter/material.dart';
import 'package:foot_app/core/buttons/card_button.dart';

class PlayersHomePage extends StatelessWidget {
  const PlayersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: CardButton(
                // TODO(any): Add translation
                cardButtonData: CardButtonData(
                  route: '',
                  title: 'Jugar',
                  imagePath: '',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 175,
                child: CardButton(
                  cardButtonData: CardButtonData(
                    route: '',
                    title: 'Jugar',
                    imagePath: '',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
