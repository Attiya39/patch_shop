import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_matter/res/common_widgets/custom_image/custom_image.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'package:u_matter/utils/constants/k_images.dart';

class CustomRoundedBackButton extends StatelessWidget {
  final VoidCallback? onBackTap;
  final color;
  const CustomRoundedBackButton({Key? key, this.onBackTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBackTap ??
          () {
            Navigator.of(context).pop();
          },
      child: CustomImage(
        imagePath: SVGIcons.backIcon,
        height: 30.h,
        width: 30.h, /// 45.h
        color: color ?? blackColor,
        fit: BoxFit.contain,
      ),
    );
  }
}
