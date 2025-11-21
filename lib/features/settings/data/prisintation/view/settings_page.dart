import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/font.dart';
import 'package:task1_cubit/core/widget/bottun_selected.dart';
import 'package:task1_cubit/features/settings/data/prisintation/manager/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color on = Theme.of(context).colorScheme.primary;
    Color off = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 70.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text('Theme Mode', style: TaskTextStyle.text18blackBlod),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonSelected(
                  text: 'Light Mode',
                  onPressed: () {
                    context.read<SettingsCubit>().changeMode(
                      mode: ThemeMode.light,
                    );
                  },
                  color:
                      context.watch<SettingsCubit>().themeMode ==
                          ThemeMode.light
                      ? on
                      : off,
                ),
                ButtonSelected(
                  text: 'Dark Mode',
                  onPressed: () {
                    context.read<SettingsCubit>().changeMode(
                      mode: ThemeMode.dark,
                    );
                  },
                  color:
                      context.watch<SettingsCubit>().themeMode == ThemeMode.dark
                      ? on
                      : off,
                ),
                ButtonSelected(
                  text: 'System Mode',
                  onPressed: () {
                    context.read<SettingsCubit>().changeMode(
                      mode: ThemeMode.system,
                    );
                  },
                  color:
                      context.watch<SettingsCubit>().themeMode ==
                          ThemeMode.system
                      ? on
                      : off,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text('Language', style: TaskTextStyle.text18blackBlod),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonSelected(
                  text: 'Arabic',
                  onPressed: () {
                    context.read<SettingsCubit>().changeLanguage(lan: "arabic");
                  },
                  width: 150,
                  color: context.watch<SettingsCubit>().themeLanguag == "arabic"
                      ? on
                      : off,
                ),
                ButtonSelected(
                  text: 'English',
                  onPressed: () {
                    context.read<SettingsCubit>().changeLanguage(
                      lan: "english",
                    );
                  },
                  width: 150.w,
                  color:
                      context.watch<SettingsCubit>().themeLanguag == "english"
                      ? on
                      : off,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ButtonSelected(
              text: 'About Us',
              onPressed: () {},
              color: on,
              textStyle: TextStyle(color: off),
            ),
            SizedBox(height: 10.h),
            ButtonSelected(
              text: 'Upgrade Acount',
              onPressed: () {},
              color: on,
              textStyle: TextStyle(color: off),
            ),
          ],
        ),
      ),
    );
  }
}
