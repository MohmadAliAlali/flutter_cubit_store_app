import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/storage/boxes.dart';
import 'package:task1_cubit/core/storage/hive_manager.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:task1_cubit/features/settings/prisintation/manager/settings_cubit.dart';
import 'package:task1_cubit/features/settings/prisintation/view/widget/accept_dailog.dart';
import 'package:task1_cubit/features/settings/prisintation/view/widget/language.dart';
import 'package:task1_cubit/features/settings/prisintation/view/widget/them_mode.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar('Settings', context),
      body: Container(
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

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(30),
                    width: 1.6,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      SizedBox(height: 16.h),
                      ThemMode(),
                      Language(),
                      glassButton(
                        label: 'About Us',
                        onTap: () {},
                        context: context,
                      ),
                      HiveManager.hasToken()
                          ? glassButton(
                            
                              color: Colors.red.withAlpha(60),
                              label: 'Delete Account',
                              onTap: () {
                                acceptDialog(
                                  
                                  context,
                                  context.read<SettingsCubit>(),
                                  'Are you sure you want to delete your account?',
                                  () => context
                                      .read<SettingsCubit>()
                                      .delete(), // ← pass the function
                                );
                              },
                              context: context,
                            )
                          : SizedBox(),
                      glassButton(
                        label: HiveManager.hasToken()
                            ? 'Logout'
                            : 'Create Account',
                        onTap: () {
                          HiveManager.hasToken()
                              ? acceptDialog(
                                  context,
                                  context.read<SettingsCubit>(),
                                  'Are you sure you want to log out?',
                                  () => context
                                      .read<SettingsCubit>()
                                      .logout(), // ← pass the function
                                )
                              : Navigator.pushNamed(context, '/register');
                        },
                        context: context,
                      ),
                      HiveManager.hasToken()?
                      glassButton(
                        label: 'Veiw Profile',
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        context: context,
                      ):SizedBox(),
                      glassButton(
                        label: 'Cart',
                        onTap: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    context.read<SettingsCubit>().logout();
  }
}
