import 'package:foot_app/app/supabase/supabase_client.dart';
import 'package:foot_app/repositories/user_preferences/user_preferences_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository {
  LoginRepository({required this.prefsRepository});

  static final SupabaseClient supabase = supabaseClient;
  final UserPreferencesRepository prefsRepository;

  Future<AuthResponse> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session?.accessToken != null) {
        await prefsRepository.saveUserProfile(email, password);
        await prefsRepository.saveUserToken(response.session!.accessToken);
      }

      return response;
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  Future<AuthResponse> signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw Exception('Error signing up: $e');
    }
  }

  Future<void> logOut() async {
    try {
      await supabase.auth.signOut();
      await prefsRepository.logout();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }

  User? getCurrentUser() {
    return supabase.auth.currentUser;
  }

  Future<UserResponse> validateToken() async {
    try {
      final accessToken = await prefsRepository.getUserToken();
      if (accessToken == null) {
        throw Exception('No access token found');
      }
      final response = await supabase.auth.getUser(accessToken);

      return response;
    } catch (e) {
      throw Exception('Error validating token: $e');
    }
  }
}
