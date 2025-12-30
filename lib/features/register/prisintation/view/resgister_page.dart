import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:task1_cubit/core/widget/glass_card.dart';
import 'package:task1_cubit/core/widget/row_message.dart';
import 'package:task1_cubit/features/register/data/local/user_local_storage.dart';
import 'package:task1_cubit/features/register/prisintation/manager/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(UserLocalStorage()),
      child: Scaffold(
        appBar: glassAppBar('Register', context),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
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
            ),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = context.read<RegisterCubit>();
                final email = cubit.email;
                final firstName = cubit.firstName;
                final lastName = cubit.lastName;
                final password = cubit.password;

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 40.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 130.h),
                      glassBox(
                        context: context,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: email,
                              labelText: "Email",
                              width: double.infinity,
                              isError:
                                  state is RegisterFieldError &&
                                  state.field == "email",
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: firstName,
                                    labelText: "First Name",
                                    width: double.infinity,
                                    isError:
                                        state is RegisterFieldError &&
                                        state.field == "first",
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: CustomTextField(
                                    controller: lastName,
                                    labelText: "Last Name",
                                    width: double.infinity,
                                    isError:
                                        state is RegisterFieldError &&
                                        state.field == "last",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            CustomPasswordField(
                              controller: password,
                              labelText: "Password",
                              width: double.infinity,
                              isError:
                                  state is RegisterFieldError &&
                                  state.field == "password",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      BlocListener<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterFieldError) {
                            Navigation.noteficationField(
                              context,
                              state.message,
                            );
                          }
                          if (state is RegisterSuccess) {
                            Navigation.noteficationSucs(
                              context,
                              "Registration successful! Please verify your email.",
                            );
                          }
                          if (state is RegisterSuccess) {
                            Navigation.noteficationSucs(
                              context,
                              "Registration successful! Please verify your email.",
                            );
                            Navigation.navigateTo(context, '/virfi');
                          }
                        },
                        child: CustomButton(
                          text: "Register",
                          onPressed: () {
                            cubit.validateFields(
                              email: email.text,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              password: password.text,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      rowMessage(
                        context,
                        "Already have an account?",
                        "Login",
                        '/login',
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
