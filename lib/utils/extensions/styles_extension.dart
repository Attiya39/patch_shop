import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StylesExtension on BuildContext {
  TextStyle get label10400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label10400Italic => label10400.copyWith(
        fontStyle: FontStyle.italic,
      );
  TextStyle get label11700 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label12400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label12700 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label12700Italic => label12700.copyWith(
        fontStyle: FontStyle.italic,
      );

  TextStyle get label13400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label14400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label15400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label15400Italic => label15400.copyWith(
        fontStyle: FontStyle.italic,
      );

  TextStyle get label15700 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label16400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label16700 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      );
  TextStyle get label16800 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
      );
  TextStyle get label16800Italic => label16800.copyWith(
        fontStyle: FontStyle.italic,
      );

  TextStyle get label18400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label20700 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label24500 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label26700 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label30700 => Theme.of(this).textTheme.titleLarge!.copyWith(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
  );
}
