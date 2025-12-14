import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;
  final bool isError;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.width,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withAlpha(8),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isError
                    ? Colors.redAccent
                    : scheme.tertiary.withAlpha(25),
                width: 1.2.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.tertiary.withAlpha(10),
                  blurRadius: 12,
                  spreadRadius: -2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  color: scheme.tertiary.withAlpha(70),
                  fontSize: 16.sp,
                ),
                border: InputBorder.none, // نزيل الحدود الافتراضية
                focusedBorder: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  bottom: 16.w,
                ), // يمين ويسار فقط
                alignLabelWithHint: true, // نُحكم بالتباعد يدويًا
              ),
            ),
          ),
        ),
      ),
    );
  }
}
