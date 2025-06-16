import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesRepository {
  UserPreferencesRepository(this.prefs);

  final SharedPreferences prefs;

  static const String _keyThemeMode = 'theme_mode';
  static const String _keyLanguage = 'language';
  static const String _keyUserToken = 'user_token';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserPassword = 'user_password';

  Future<String?> getUserToken() async {
    return prefs.getString(_keyUserToken);
  }

  Future<void> saveUserToken(String token) async {
    await prefs.setString(_keyUserToken, token);
  }

  Future<void> logout() async {
    await prefs.remove(_keyUserToken);
    await prefs.remove(_keyUserEmail);
    await prefs.remove(_keyUserPassword);
  }

  Future<void> saveUserProfile(String email, String password) async {
    await prefs.setString(_keyUserEmail, email);
    await prefs.setString(_keyUserPassword, password);
  }

  Future<void> saveThemeMode(String themeMode) async {
    await prefs.setString(_keyThemeMode, themeMode);
  }

  Future<String?> getThemeMode() async {
    return prefs.getString(_keyThemeMode);
  }

  Future<void> saveLanguage(String language) async {
    await prefs.setString(_keyLanguage, language);
  }

  Future<String?> getLanguage() async {
    return prefs.getString(_keyLanguage);
  }

  Future<void> clearPreferences() async {
    await prefs.clear();
  }
}
