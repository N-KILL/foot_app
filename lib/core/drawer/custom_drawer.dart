import 'package:flutter/material.dart';
import 'package:foot_app/core/text/large_text.dart';
import 'package:foot_app/core/themes/themes.dart';
import 'package:foot_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDarkMode = themeProvider.themeMode == darkTheme;
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.primary,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                // TODO(Any): Replace with actual username and pic
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 48,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: largeText('Home', context),
                  trailing: Icon(
                    Icons.home,
                    color: theme.colorScheme.secondary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    GoRouter.of(context).go('/');
                  },
                ),

                // TODO(any): Remove this access
                ListTile(
                  title: largeText('Go to Player Home', context),
                  trailing: Icon(
                    Icons.home,
                    color: theme.colorScheme.secondary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    GoRouter.of(context).go('/home_players');
                  },
                ),

                ListTile(
                  title: largeText(l10n.drawerSwitchTheme, context),
                  trailing: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: theme.colorScheme.secondary,
                  ),
                  onTap: themeProvider.toggleTheme,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: largeText('Config', context),
                trailing: Icon(
                  Icons.settings,
                  color: theme.colorScheme.onSecondary,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
