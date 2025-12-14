import 'package:flutter/material.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_card.dart';
import 'package:task1_cubit/core/widget/row_message.dart';
import 'package:task1_cubit/features/reset_paswword/prisintation/manager/reset_password_cubit.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_password_field.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RestPasswordPage extends StatelessWidget {
  RestPasswordPage({super.key});
  final _email = TextEditingController();
  final _password = TextEditingController();

  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPaswordState>(
        listener: (context, state) {
          if (state is ResetPasswordFieldError) {
            errorField = state.field;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Virfi your email"),
                backgroundColor: Colors.green,
              ),
            );
            Navigation.navigateTo(context, '/virfi');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: glassAppBar('Reset Password', context),
            extendBodyBehindAppBar: true,
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
                                    Text('Enter your email and new password'),
                                    SizedBox(height: 12.h),
                                    CustomTextField(
                                      controller: _email,
                                      labelText: 'Eamil',
                                      width: double.infinity,
                                      isError: errorField == 'email',
                                    ),
                                    SizedBox(height: 16.h),
                                    CustomPasswordField(
                                      controller: _password,
                                      labelText: 'New Password',
                                      width: double.infinity,
                                      isError: errorField == 'password',
                                    ),
                                    SizedBox(height: 12.h),
                                  ],
                                ),
                                context: context,
                              ),
                              SizedBox(height: 20.h),
                              CustomButton(
                                text: 'Reset Password',
                                onPressed: () {
                                  context
                                      .read<ResetPasswordCubit>()
                                      .validateFields(
                                        email: _email.text,
                                        password: _password.text,
                                      );
                                },
                              ),
                              SizedBox(height: 80.h),
                              rowMessage(
                                context,
                                ' you want back to',
                                'login ?',
                                '/login',
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
