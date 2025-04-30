import 'package:flutter/material.dart';
import 'package:foot_app/core/buttons/icon_button.dart';
import 'package:foot_app/core/drawer/custom_drawer.dart';
import 'package:foot_app/core/text/title.dart';
import 'package:foot_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: CustomTitle(
          l10n.homePageAppBarTitle,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        leading: Builder(
          builder: (context) => CustomIconButton(
            icon: Icons.menu,
            iconColor: Theme.of(context).colorScheme.surface,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: navigationShell,
      ),
    );
  }
}
