import 'package:flutter/material.dart';
import 'package:foot_app/core/text/large_text.dart';
import 'package:foot_app/core/themes/themes.dart';
import 'package:foot_app/l10n/l10n.dart';
import 'package:foot_app/repositories/login/login_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userData = '';
  Future<void> _logout(BuildContext context) async {
    final loginRepository = Provider.of<LoginRepository>(
      context,
      listen: false,
    );

    await loginRepository.logOut();

    if (context.mounted) {
      GoRouter.of(context).go('/login');
    }
  }

  Future<User?> getUserData(BuildContext context) async {
    return Provider.of<LoginRepository>(
      context,
      listen: false,
    ).getCurrentUser();
  }

  @override
  void initState() {
    super.initState();
    getUserData(context).then((user) {
      setState(() {
        userData = user?.email ?? '';
      });
    });
  }

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
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      userData,
                      style: const TextStyle(
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
                    GoRouter.of(context).go('/home');
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
              child: Column(
                children: [
                  ListTile(
                    title: largeText('Config', context),
                    trailing: Icon(
                      Icons.settings,
                      color: theme.colorScheme.onSecondary,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: largeText('Logout', context),
                    trailing: Icon(
                      Icons.logout,
                      color: theme.colorScheme.onSecondary,
                    ),
                    onTap: () => _logout(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
