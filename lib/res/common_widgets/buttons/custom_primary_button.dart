import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/custom_image/custom_image.dart';
import 'package:u_matter/res/common_widgets/containers/text_adjuster_widget.dart';
import 'package:u_matter/utils/constants/color_constants.dart';

class CustomPrimaryButton extends StatefulWidget {
  const CustomPrimaryButton({
    super.key,
    required this.title,
    this.icon,
    this.isLoading,
    this.onTap,
    this.backgroundColor,
    this.outlineColor,
    this.borderRadius,
    this.height,
    this.width,
    this.titleColor,
    // this.loader,
    this.suffixIcon,
    this.textStyle,
    this.iconShouldHaveColor = true,
    this.loaderColor,
  });

  final String title;
  final String? icon;
  final bool? isLoading;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? outlineColor;
  final double? borderRadius;
  // final Loader? loader;
  final String? suffixIcon;
  final TextStyle? textStyle;
  final bool iconShouldHaveColor;
  final Color? loaderColor;

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ?? false ? () {} : widget.onTap,
      child: Container(
        height: widget.height ?? 60.h,
        //    width: widget.width ?? context.width,
        width: widget.width ?? context.width,
        decoration: ShapeDecoration(
          color: _getColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 18.r),
            side: BorderSide(
              color: widget.outlineColor ?? Colors.transparent,
              width: 1.r,
            ),
          ),
        ),
        child: (widget.isLoading != null && widget.isLoading!)
            ? Center(
                // child: ButtonLoaderView(
                //   loader: widget.loader,
                // ),

                child: CircularProgressIndicator(
                  color: widget.loaderColor ?? white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    CustomImage(
                      // color: widget.iconShouldHaveColor ? (widget.titleColor ?? context.primaryButtonTextColor,
                      color: widget.iconShouldHaveColor
                          ? (widget.titleColor ?? Colors.blue)
                          : null,
                      imagePath: widget.icon!,
                      height: 20.h,
                      width: 20.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                  Flexible(
                    // child: AutoSizeText(
                    //   widget.title,
                    //   style: widget.textStyle ??
                    //       context.label16600.copyWith(
                    //         color: widget.onTap != null ? widget.titleColor ?? context.primaryButtonTextColor : context.titleTextColor.withOpacity(.3),
                    //       ),
                    //   maxLines: 1,
                    // ),

                    child: TextAdjusterWidget(
                      paddingValue: 20.w,
                      child: Text(
                        widget.title,
                        style: widget.textStyle ?? TextStyle(color: Colors.black),
                        // context.label16600.copyWith(
                        //   color: widget.onTap != null ? widget.titleColor ?? context.primaryButtonTextColor : context.titleTextColor.withOpacity(.3),
                        // ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  if (widget.suffixIcon != null) ...[
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomImage(
                      imagePath: widget.suffixIcon!,
                      // color: widget.titleColor ?? context.primaryButtonTextColor,
                      color: widget.titleColor ?? Colors.blue,
                      height: 20.h,
                      width: 20.h,
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Color get _getColor {
    if (widget.onTap == null) {
      // return context.primaryButtonDisabledColor;
      return Colors.black26;
    }
    // return widget.backgroundColor ?? context.primaryButtonColor;
    return widget.backgroundColor ?? Colors.blue;
  }
}
