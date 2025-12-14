import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final bool isError;

  const CustomPasswordField({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.height,
    this.width,
    this.isError = false,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: widget.width ?? 260.w,
      child: Row(
        children: [
          // حقل نص زجاجي
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(8),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: widget.isError
                          ? Colors.redAccent
                          : scheme.tertiary.withAlpha(25),
                      width: 1.2.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.tertiary.withAlpha(10),
                        blurRadius: 12,
                        spreadRadius: -2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: _obscure,
                    validator: widget.validator,
                    onChanged: widget.onChanged,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16.sp,
                    ),
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: TextStyle(
                        color: scheme.tertiary.withAlpha(70),
                        fontSize: 16.sp,
                      ),
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: 16.h,
                      ), 
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 6.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: InkWell(
                onTap: () => setState(() => _obscure = !_obscure),
                borderRadius: BorderRadius.circular(16.r),
                child: Ink(
                  width: (widget.height ?? 58.w),
                  height: (widget.height ?? 58.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(10),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.tertiary.withAlpha(25),
                      width: 1.6.w,
                    ),
                  ),
                  child: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    size: 20.sp,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
