import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/account_screen_view/account_screen_view_model.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_view_model.dart';

import '../../res/common_widgets/custom_scaffold_view.dart';

class CartScreenView extends GetView<CartScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isBackButtonEnabled: false,
      hasLogoImage: false,
      title: "cart".tr.toUpperCase(),
      body: SizedBox.expand(),

    );
  }
}
