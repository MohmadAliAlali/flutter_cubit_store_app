
import 'package:flutter/material.dart';
import 'package:task1_cubit/core/navigation.dart';
import 'package:task1_cubit/core/widget/app_bar.dart';
import 'package:task1_cubit/core/widget/glass_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_cubit/features/home/prisintation/view/widget/list.dart';
import 'package:task1_cubit/features/product_info/prisintation/view/widget/galss_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar('Settings', context),
      body: Container(
        padding: EdgeInsets.only(top: 64.h, left: 12.w, right: 12.w),
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
        child: Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            SizedBox(
              height: 390.h,
              child: 
                 const VerticalProductsList(), 
            
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 310.h),
              child: SizedBox(
                height: 100.h,
                child: glassCard(
                  context: context,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      glassButton(
                        width: 140.w,
                        label: 'Cart',
                        onTap: () =>
                            Navigation.navigateToScreen(context, '/cart'),
                        context: context,
                      ),
                      glassButton(
                        width: 140.w,
                        label: 'Favourites',
                        onTap: () =>
                            Navigation.navigateToScreen(context, '/favourites'),
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 420.h),
              child: SizedBox(
                height: 200.h,
                child:
                    const HorizontalProductsList(), 
              ),
            ), //
          ],
        ),
      ),
    );
  }
}
