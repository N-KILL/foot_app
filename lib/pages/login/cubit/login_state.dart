part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage,
    this.hidePassword = true,
  });

  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? errorMessage;
  final bool hidePassword;

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    bool? hidePassword,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isFailure,
        errorMessage,
        hidePassword,
      ];
}
