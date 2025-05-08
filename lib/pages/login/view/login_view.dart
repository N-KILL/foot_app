import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_app/core/buttons/primary_button.dart';
import 'package:foot_app/core/textfield/custom_text_field.dart';
import 'package:foot_app/pages/login/cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // TODO(any): Translate this page

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state.isSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/home');
              });
            }
            if (state.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (ModalRoute.of(context)?.isCurrent != null &&
                    ModalRoute.of(context)!.isCurrent) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                }
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              });
            }

            if (state.isFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login failed. Please try again.'),
                  ),
                );
              });
            }

            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login to Foot App',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorScheme.onSecondary,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          CustomTextField(
                            hintText: 'Login',
                            prefixIcon: const Icon(Icons.person_outline),
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            hintText: 'Password',
                            obscureText: state.hidePassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .togglePasswordVisibility();
                              },
                              icon: const Icon(Icons.visibility_off_outlined),
                            ),
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'forgot password?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PrimaryButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() !=
                                          null &&
                                      !_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  context.read<LoginCubit>().login(
                                        _usernameController.text,
                                        _passwordController.text,
                                      );
                                },
                                width: 150,
                                text: 'LOGIN',
                                trailingIcon: Icons.arrow_forward,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              color: colorScheme.tertiary,
                            ),
                          ),
                          onTap: () => context.go('/register'),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
