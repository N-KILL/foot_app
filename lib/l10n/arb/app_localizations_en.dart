// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'FootBall Field Manager';

  @override
  String get homePageAppBarTitle => 'FootBall Field Manager';

  @override
  String get newShiftButtonText => 'New Shift';

  @override
  String get shiftButtonText => 'Shifts';

  @override
  String get customizeButtonText => 'Customize';

  @override
  String get configButtonText => 'Configuration';

  @override
  String get drawerFields => 'Fields';

  @override
  String get drawerShifts => 'Shifts';

  @override
  String get drawerSwitchTheme => 'Switch theme';

  @override
  String get shiftPageTitle => 'Shifts';

  @override
  String get errorLoadingShifts => 'Error loading shifts';

  @override
  String get reloadButton => 'Reload';
}
