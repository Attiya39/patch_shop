import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_primary_button.dart';

import '../../../utils/constants/color_constants.dart';

class NetworkErrorView extends StatelessWidget {
  final VoidCallback onRetry;
  final String title;
  final String subtitle;
  final bool isBack;

  NetworkErrorView({
    required this.onRetry,
    required this.title,
    this.isBack = false,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 50.sp,
            color: appSecondaryColor,
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            // 'no_internet_connection'.tr,
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              subtitle,
              // 'no_internet_error_subtitle'.tr,
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          CustomPrimaryButton(
            height: 35.h,
            width: 109.w,
            onTap: onRetry,
            backgroundColor: appSecondaryColor,
            textStyle: TextStyle(
              color: whiteColor,
              fontSize: 15.sp,
              fontStyle: FontStyle.italic,
            ),
            title: 'retry'.tr,
            borderRadius: 25.r,
          ),
          if (isBack)
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CustomPrimaryButton(
                height: 35.h,
                width: 109.w,
                onTap: () {
                  Get.back();
                },
                backgroundColor: appSecondaryColor,
                textStyle: TextStyle(
                  color: whiteColor,
                  fontSize: 15.sp,
                  fontStyle: FontStyle.italic,
                ),
                title: 'back'.tr.capitalize!,
                borderRadius: 25.r,
              ),
            ),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}
