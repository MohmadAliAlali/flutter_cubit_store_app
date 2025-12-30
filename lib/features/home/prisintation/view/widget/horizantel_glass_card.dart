import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/core/style/color.dart';
import 'package:task1_cubit/features/product_info/data/product_info_model.dart';

/// كارد زجاجي أفقي جديد:
/// صورة منحنية الأطراف تغطي الجزء العلوي + العنوان + الوصف + السعر
Widget topCurvedGlassCard({
  required String titleText,
  required double price,
  required double rate,
  required String description,
  required String image,
  required BuildContext context,
}) {
  final scheme = Theme.of(context).colorScheme;

  return ClipRRect(
    borderRadius: BorderRadius.circular(16.r),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(8),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(20),
            width: 1.6.w,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== الجزء العلوي: صورة مربعة منحنية الأطراف ======
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 80.h, // نصف ارتفاع الكارد تقريبًا
                fit: BoxFit.cover,
              ),
            ),
            // ====== العنوان ======
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Text(
                titleText,
                style: TextStyle(
                  color: scheme.brightness == Brightness.dark
                      ? Colors.white
                      : scheme.tertiary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // ====== الوصف ======
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                description,
                style: TextStyle(
                  color: scheme.brightness == Brightness.dark
                      ? Colors.white70
                      : scheme.tertiary.withAlpha(80),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(), // يدفع السعر للأسفل
            Padding(
              padding: EdgeInsetsGeometry.all(12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$rate 🌟',
                    style: TextStyle(
                      color: TaskColor.lightGreen,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$price \$',
                    style: TextStyle(
                      color: TaskColor.lightGreen,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget horizontalCard(ProductInfoModel p, BuildContext context) {
  return SizedBox(
    width: 140.w,
    height: 200.h,
    child: topCurvedGlassCard(
      image: p.image,
      titleText: p.title,
      price: p.price,
      rate: p.rate,
      description: p.description,
      context: context,
    ),
  );
}
