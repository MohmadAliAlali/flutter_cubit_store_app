import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/route/route.dart';
import 'package:task1_cubit/core/them.dart';
import 'package:task1_cubit/features/settings/data/prisintation/manager/settings_cubit.dart';

void main() {
  runApp(BlocProvider(create: (_) => SettingsCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final cubit = context.watch<SettingsCubit>();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: cubit.themeMode,
              initialRoute: AppRoutes.splash,
              routes: AppRoutes.routes,
            );
          },
        );
      },
    );
  }
}
