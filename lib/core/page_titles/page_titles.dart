import 'package:flutter/material.dart';
import 'package:foot_app/core/text/title.dart';
import 'package:go_router/go_router.dart';

class PageTitles extends StatelessWidget {
  const PageTitles({
    required this.pageTitle,
    this.icon,
    super.key,
  });

  final String pageTitle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
        CustomTitle(
          pageTitle,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              icon ?? const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
