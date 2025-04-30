// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'FootBall Field Manager';

  @override
  String get homePageAppBarTitle => 'Administrador de Canchas de Futbol';

  @override
  String get newShiftButtonText => 'Agregar turno';

  @override
  String get shiftButtonText => 'Turnos';

  @override
  String get customizeButtonText => 'Personalizar';

  @override
  String get configButtonText => 'Configuración';

  @override
  String get drawerFields => 'Canchas';

  @override
  String get drawerShifts => 'Turnos';

  @override
  String get drawerSwitchTheme => 'Cambiar tema';

  @override
  String get shiftPageTitle => 'Turnos';

  @override
  String get errorLoadingShifts => 'Error al cargar los turnos';

  @override
  String get reloadButton => 'Recargar';
}
