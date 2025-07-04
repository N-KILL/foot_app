import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foot_app/repositories/login/login_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(const LoginState());

  final LoginRepository _loginRepository;

  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        hidePassword: !state.hidePassword,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: false,
      ),
    );
  }

  Future<void> login(String username, String password) async {
    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: false,
      ),
    );
    if (username.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: 'Please fill in all fields',
        ),
      );
      return;
    }
    try {
      emit(
        state.copyWith(
          isLoading: true,
          isSuccess: false,
          isFailure: false,
        ),
      );
      await _loginRepository.signInWithEmail(
        username,
        password,
      );

      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
        ),
      );
    } catch (e) {
      // TODO(any): Try to catch specific exceptions, like incorrect password
      //  or user not found, etc.
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: 'An error occurred: $e',
        ),
      );
    }
  }
}
