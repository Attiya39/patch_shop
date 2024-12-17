import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/error_views/network_error_view.dart';
import 'package:u_matter/res/common_widgets/error_views/primary_error_center_container_view.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.text,
    this.subtitle,
    required this.onRetry,
    this.buttonText,
    this.serverErrorText,
    this.isBack = false,
  }) : super(key: key);

  final String? buttonText;
  final String? text;
  final String? subtitle;
  final String? serverErrorText;
  final VoidCallback onRetry;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    if (serverErrorText != null) {
      return IntrinsicHeight(
        child: Container(
          // width: double.infinity,
          // constraints: BoxConstraints(
          //   minHeight: context.height,
          // ),
          child: NetworkErrorView(
            isBack: isBack,
            title: "error_key".tr.capitalize!,
            subtitle: serverErrorText ?? "something_went_wrong".tr,
            onRetry: onRetry,
          ),
        ),
      );
    }
    return IntrinsicHeight(
      child: Container(
        // width: double.infinity,
        // constraints: BoxConstraints(
        //   minHeight: context.height / 2,
        // ),
        child: PrimaryErrorCenterContainerView(
          title: text != null ? "error_no_data_title".tr +" $text" : "error_key".tr.capitalize!,
          subtitle: text != null
              ? "error_no_data_str1".tr +" $text "+"error_no_data_str2".tr +". " + "error_no_data_str3".tr
              : "something_went_wrong".tr,
          onRetry: onRetry,
        ),
      ),
    );
  }
}
