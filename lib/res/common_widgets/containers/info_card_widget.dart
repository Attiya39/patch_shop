import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:u_matter/res/common_widgets/containers/text_adjuster_widget.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'package:u_matter/utils/constants/k_images.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

import '../buttons/custom_primary_button.dart';
import '../custom_image/custom_image.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    this.titleImage,
    this.title,
    this.subTitle,
    this.price,
    this.onTap,
    this.hasButton,
  });

  final String? titleImage;
  final String? title;
  final String? subTitle;
  final String? price;
  final VoidCallback? onTap;
  final bool? hasButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Opacity(
            opacity: 0.9,  // Fully transparent
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h,),
              // width: 140.h,  // Fixed width: 142px
              height: 230.h, // Fixed height: 210
              decoration: BoxDecoration(
                // color: Colors.blue, // Background color (won't be visible due to opacity)
                borderRadius: BorderRadius.circular(8.r),

                border: Border.all(color: opaqueGreyColor, width: 1.0,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImage(
                    imagePath: titleImage ?? SVGIcons.bellIcon,
                    height: 130.h,
                    width: 160.h,
                    fit: BoxFit.cover,
                  ),
                  if(title != null) ... [  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
                    child: Text(
                      title ?? 'name_key'.tr.capitalize!,
                      // 'Notifications',

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.label12400.copyWith(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                  ),
                    if(subTitle != null)
                      SizedBox(
                        height: 5.h,
                      ),
                  ],
                  if(subTitle != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
                      child: Text(
                        subTitle ?? 'name_key'.tr.capitalize!,
                        overflow: TextOverflow.ellipsis,
                        // 'Notifications',
                        maxLines: 2,
                        style: context.label10400,
                      ),
                    ),
                  if(price != null) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        price ?? 'price'.tr.capitalize!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: context.label10400.copyWith(
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],

                  if(hasButton == true)
                    Flexible(child: CustomPrimaryButton(
                      height: 35.h,
                      width: 75.w,
                      title: "select".tr.capitalize!,
                      textStyle: context.label13400.copyWith(
                        color: appSecondaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                      outlineColor: appSecondaryColor,
                      borderRadius: 8.r,
                      backgroundColor: whiteColor,
                      onTap: onTap,
                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
