import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foot_app/app/routes/routes.dart';
import 'package:foot_app/core/themes/themes.dart';
import 'package:foot_app/l10n/l10n.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp.router(
      theme: Provider.of<ThemeProvider>(context).themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
