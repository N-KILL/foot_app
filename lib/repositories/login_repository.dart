import 'package:foot_app/app/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository {
  static final SupabaseClient supabase = supabaseClient;

  Future<AuthResponse> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
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

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }

  User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
}
