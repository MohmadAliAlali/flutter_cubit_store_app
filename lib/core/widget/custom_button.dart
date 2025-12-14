import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task1_cubit/core/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(Colors.lightGreenAccent.withAlpha(70)),
          side: WidgetStateProperty.all(
            BorderSide(
              color: color ?? TaskColor.lightGreen,
              width: 1.5.w,
            ),
          ),
        ),
        child: GestureDetector(
          
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}