import 'package:flutter/material.dart';
import 'package:task1_cubit/core/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSelected extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  
  const ButtonSelected({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.textStyle,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width?.w,
        padding: EdgeInsets.all(8.w),
        height: height?.h ?? 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: color ?? TaskColor.lightGreen, width: 2),
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
        ),
        child: Center(
          child: Text(
            text, 
            style: textStyle ?? TextStyle(
              color: color ?? TaskColor.lightGreen,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}