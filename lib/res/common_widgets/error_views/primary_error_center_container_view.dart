import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_primary_button.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

class PrimaryErrorCenterContainerView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? lottie;
  final Color? contentBackgroundColor;
  final Color? iconBackgroundColor;
  final VoidCallback onRetry;

  PrimaryErrorCenterContainerView({
    required this.title,
    required this.subtitle,
    this.lottie,
    this.contentBackgroundColor,
    this.iconBackgroundColor,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              // Icons.hourglass_empty,
              Icons.folder_off_outlined,
              size: 50.sp,
              color: greyCardBgColor,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: context.label16700,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: context.label12700,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

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
              title: 'retry'.tr.capitalize!,
              borderRadius: 25.r,
            ),
          ]
        ),
      ),
    );
  }
}
