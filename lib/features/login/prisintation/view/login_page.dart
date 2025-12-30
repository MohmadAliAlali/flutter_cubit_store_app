import 'package:flutter/material.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_card.dart';
import 'package:task1_cubit/core/widget/row_message.dart';
import 'package:task1_cubit/features/login/prisintation/manager/login_cubit.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final password = context.read<LoginCubit>().password;
          final email = context.read<LoginCubit>().email;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: glassAppBar('Login', context),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: Theme.of(context).brightness == Brightness.dark
                          ? const [Color(0xFF1E1E1E), Color(0xFF121212)]
                          : const [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
                    ),
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              glassBox(
                                child: Column(
                                  children: [
                                    Text('Enter your login details'),
                                    SizedBox(height: 12.h),
                                    CustomTextField(
                                      controller: email,
                                      labelText: 'Eamil',
                                      width: double.infinity,
                                      isError: errorField == 'email',
                                    ),
                                    SizedBox(height: 16.h),
                                    CustomPasswordField(
                                      controller: password,
                                      labelText: 'Password',
                                      width: double.infinity,
                                      isError: errorField == 'password',
                                    ),
                                  ],
                                ),
                                context: context,
                              ),
                              SizedBox(height: 12.h),
                              rowMessage(
                                context,
                                'if forgite your password ?',
                                'rest password',
                                '/rePass',
                              ),

                              SizedBox(height: 12.h),

                              BlocListener<LoginCubit, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginFieldError) {
                                    errorField = state.field;
                                    Navigation.noteficationField(
                                      context,
                                      state.message,
                                    );
                                  }
                                  if (state is LoginSuccess) {
                                    {
                                      Navigation.noteficationSucs(
                                        context,
                                        'login successful!',
                                      );
                                      Navigation.navigateAndRemove(
                                        context,
                                        '/navbar',
                                      );
                                    }
                                  }
                                },
                                child: CustomButton(
                                  text: 'Login',
                                  onPressed: () {
                                    context.read<LoginCubit>().validateFields(
                                      email: email.text,
                                      password: password.text,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 60.h),
                              rowMessage(
                                context,
                                'you dont have any acount',
                                'register',
                                '/register',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
