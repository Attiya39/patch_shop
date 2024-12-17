import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_view_model.dart';

import '../../res/common_widgets/custom_scaffold_view.dart';

class SellScreenView extends GetView<SellScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isBackButtonEnabled: false,
      hasLogoImage: false,
      title: "sell".tr.toUpperCase(),
      body: SizedBox.expand(),

    );
  }
}
