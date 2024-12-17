import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_matter/res/common_widgets/header/design_header_view.dart';
import 'package:u_matter/utils/extensions/size_extensions.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    this.title,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.statusBarColor,
    this.imgHeight,
    this.systemNavigationBarColor,
    this.isStatusBarBrightnessDark = true,
    this.contentBackgroundColor,
    this.padding,
    this.isBackButtonEnabled = true,
    this.hasLogoImage = true,
    this.onBackTap,
  }) : super(key: key);

  final String? title;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final bool isStatusBarBrightnessDark;
  final Color? contentBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool? isBackButtonEnabled;
  final bool? hasLogoImage;
  final VoidCallback? onBackTap;
  final imgHeight;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
        statusBarColor: statusBarColor ?? Colors.white,
        systemNavigationBarColor:
            systemNavigationBarColor ?? Colors.transparent,
      ),
      child: Scaffold(
        key: key,
        backgroundColor: backgroundColor ?? Colors.white,
        //bottomNavigationBar: bottomNavigationBar,
        //bottomSheet: bottomSheet,
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: SafeArea(
            child: Column(
              children: [
                DesignHeaderView(
                  title: title,
                  hasLogoImage: hasLogoImage,
                  isBackButtonEnabled: isBackButtonEnabled,
                  onBackTap: onBackTap,
                  height: imgHeight ?? 100.h,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: padding,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: body,
                    ),
                    decoration: BoxDecoration(
                      color: contentBackgroundColor ?? Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
