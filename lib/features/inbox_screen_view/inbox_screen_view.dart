import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_view_model.dart';

import '../../res/common_widgets/custom_scaffold_view.dart';

class InboxScreenView extends GetView<InboxScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isBackButtonEnabled: false,
      hasLogoImage: false,
      title: "inbox".tr.toUpperCase(),
      body: SizedBox.expand(),

    );
  }
}
