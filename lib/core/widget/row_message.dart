  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/navigation.dart';

Widget rowMessage(BuildContext context,String message ,String dirction,String page) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: 14.sp,
            // backgroundColor: ,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        TextButton(
          onPressed: () => Navigation.navigateTo(context, page),
          child: Text(
            dirction,
            style: TextStyle(
              fontSize: 14.sp,
              color: scheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }