import 'package:foot_app/repositories/repositories.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> repositoryProviders = [
  Provider<UserPreferencesRepository>(
    create: (context) => UserPreferencesRepository(
      context.read<SharedPreferences>(),
    ),
  ),
  ProxyProvider<UserPreferencesRepository, LoginRepository>(
    update: (context, prefsRepository, previous) =>
        LoginRepository(prefsRepository: prefsRepository),
  ),
];
