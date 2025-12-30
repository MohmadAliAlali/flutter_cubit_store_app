import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:task1_cubit/features/settings/prisintation/manager/settings_cubit.dart';

void acceptDialog(
  BuildContext ctx,
  SettingsCubit cubit,
  String message,
  VoidCallback onTap,
) {
  final overlay = Overlay.of(ctx);
  late OverlayEntry entry;
  bool removed = false; // علم

  entry = OverlayEntry(
    builder: (_) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!removed) {
          removed = true;
          entry.remove();
        }
      },
      child: Container(
        width: 200.w,
        height: 140.h,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
              child: AcceptDailog(
                onTap: onTap,
                message: message,
                cubit: cubit,
                onClose: () {
                  if (!removed) {
                    removed = true;
                    entry.remove();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);
}

class AcceptDailog extends StatelessWidget {
  final VoidCallback onClose;
  final SettingsCubit cubit;
  final String message;
  final VoidCallback onTap;

  const AcceptDailog({
    super.key,
    required this.onClose,
    required this.cubit,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 60.h),
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                // width: 600.w,
                height: 160.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: scheme.brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.08)
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: scheme.tertiary.withOpacity(0.25),
                    width: 1.2.w,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    SizedBox(height: 12.h),
                    Row(
                      spacing: 10.w,
                      children: [
                        glassButton(
                          label: 'OK',
                          width: 110,
                          onTap: () {
                            onTap(); // ← add ()
                            onClose(); // ← add ()
                          },
                          context: context,
                          color: Colors.red.withAlpha(60),
                        ),
                        glassButton(
                          width: 110.w,
                          label: 'Colse',
                          onTap: onClose,
                          context: context,
                          color: Colors.green.withAlpha(60),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
