import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_rounded_back_button.dart';
import 'package:u_matter/res/common_widgets/containers/text_adjuster_widget.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'package:u_matter/utils/constants/k_images.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

import '../buttons/custom_primary_button.dart';
import '../custom_image/custom_image.dart';

class DesignHeaderView extends StatelessWidget {
  const DesignHeaderView({
    super.key,
    required this.height,
    this.title,
    this.isBackButtonEnabled,
    this.onBackTap,
    this.hasLogoImage,
  });

  final String? title;
  final height;
  final bool? isBackButtonEnabled;
  final bool? hasLogoImage;
  final VoidCallback? onBackTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Container(
          width: context.width,
          child: Column(
            children: [
              if(hasLogoImage == true)
                SizedBox(
                height: height,  /// for basic scaffold, height is 100.h
                width: context.width,
                child: Stack(
                  children: [
                    CustomImage(
                      imagePath: SVGImages.uMatterSpaBannerLogoPNG,
                      height: height,
                      width: context.width,
                      fit: BoxFit.contain,
                    ),
                    if (isBackButtonEnabled == true)
                      Positioned(
                        left: 20.w,
                        top: 30.h,
                        child: CustomRoundedBackButton(
                          onBackTap: onBackTap,
                        ),

                      ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),

              Container(
                height: 58.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide( // Only the bottom border
                      color: hasLogoImage == true? appSecondaryColor : blackColor,
                      width: 1.0, // Set the thickness of the bottom border
                    ),
                  ),
                  // borderRadius: BorderRadius.circular(8.r),
                  ),
                alignment: Alignment.center,
                child: hasLogoImage == true ?
                    TextAdjusterWidget(
                  paddingValue: 20.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    title ?? "u_matter_spa_key".tr,
                    // "Crew Connect",
                    style: context.label16700.copyWith(
                      color: appSecondaryColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
                : Row(
                  children: [
                    if(isBackButtonEnabled == true)
                      CustomRoundedBackButton(
                        onBackTap: onBackTap,
                      ),
                    Center(
                      child: TextAdjusterWidget(
                        paddingValue: 20.w,
                        child: Text(
                          textAlign: TextAlign.center,
                          title ?? "u_matter_spa_key".tr,
                          // "Crew Connect",
                          style: context.label16700.copyWith(
                            color: blackColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
