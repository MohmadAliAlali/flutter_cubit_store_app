import 'package:flutter/material.dart';
import 'package:task1_cubit/core/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContiner extends StatelessWidget {
  final String info;
  final String title;
  final Color? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? height;
  final double? width1;
  final double? width2;

  const InfoContiner({
    super.key,
    required this.title,
    required this.info,
    this.color,
    this.borderRadius,
    this.textStyle,
    this.height,
    this.width1,
    this.width2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width1?.w,
          padding: EdgeInsets.all(8.w),
          height: height?.h ?? 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: color ?? TaskColor.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
          ),
          child: Center(
            child: Text(
              title,
              style:
                  textStyle ??
                  TextStyle(
                    color: color ?? TaskColor.lightGreen,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          width: width2?.w,
          padding: EdgeInsets.all(8.w),
          height: height?.h ?? 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: color ?? TaskColor.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 10.r),
          ),
          child: Center(
            child: Text(
              info,
              style:
                  textStyle ??
                  TextStyle(
                    color: color ?? TaskColor.lightGreen,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
