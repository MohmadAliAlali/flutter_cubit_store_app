import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/custom_button.dart';
import 'package:task1_cubit/core/widget/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_cubit/core/widget/glass_card.dart';
import 'package:task1_cubit/core/widget/row_message.dart';
import 'package:task1_cubit/features/virfi_page/prisintation/manager/virfi_cubit.dart';

// ignore: must_be_immutable
class VirfiPage extends StatelessWidget {
  VirfiPage({super.key});
  String? errorField;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VirfiCubit(),
      child: BlocBuilder<VirfiCubit, VirfiState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: glassAppBar('Virfication page ', context),
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
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              glassBox(
                                child: Column(
                                  children: [
                                    Text('Virfication Code'),
                                    SizedBox(height: 12.h),
                                    CustomTextField(
                                      controller: context
                                          .read<VirfiCubit>()
                                          .code,
                                      labelText: 'Virfication code',
                                      width: double.infinity,
                                      isError: errorField == 'code',
                                    ),
                                  ],
                                ),
                                context: context,
                              ),
                              SizedBox(height: 12),

                              BlocListener<VirfiCubit, VirfiState>(
                                listener: (context, state) {
                                  if (state is VirfiFieldError) {
                                    errorField = state.field;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  if (state is VirfiSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Virfi your email sucsses !",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigation.navigateTo(context, '/login');
                                  }
                                },
                                child: CustomButton(
                                  text: 'Virfication',
                                  onPressed: () {
                                    context.read<VirfiCubit>().validateFields(
                                      code: context
                                          .read<VirfiCubit>()
                                          .code
                                          .text,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 80),
                              rowMessage(
                                context,
                                'resend virfication code? ',
                                'send',
                                '/virfi',
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
