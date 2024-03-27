import 'package:ecomm_bloc_app/core/common/widgets/loader.dart';
import 'package:ecomm_bloc_app/core/utils/show_snackbar.dart';
import 'package:ecomm_bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecomm_bloc_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final gap = const SizedBox(
    height: 25,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              print(state);
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthFormField(
                    controller: emailController,
                    hintText: 'email',
                  ),
                  gap,
                  AuthFormField(
                    controller: passwordController,
                    hintText: 'password',
                    isObscureText: true,
                  ),
                  gap,
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('ff');
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const Text("Login"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
