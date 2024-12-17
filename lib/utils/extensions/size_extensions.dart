import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension SizeEx on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get paddingTop {
    return MediaQuery.of(this).padding.top > 0
        ? max(MediaQuery.of(this).padding.top, 44.h)
        : 44.h;
  }

  double get paddingBottom {
    return MediaQuery.of(this).padding.bottom > 0
        ? MediaQuery.of(this).padding.bottom
        : 30.h;
  }

  Size get size => MediaQuery.of(this).size;

  bool get isTablet => ContextExtensionss(this).isTablet;
  bool get isMobile => ContextExtensionss(this).isPhone;
}
