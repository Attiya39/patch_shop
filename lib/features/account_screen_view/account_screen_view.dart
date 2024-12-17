import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/account_screen_view/account_screen_view_model.dart';

import '../../res/common_widgets/custom_scaffold_view.dart';

class AccountScreenView extends GetView<AccountScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isBackButtonEnabled: false,
      hasLogoImage: false,
      title: "profile".tr.toUpperCase(),
      body: SizedBox.expand(),

    );
  }
}
