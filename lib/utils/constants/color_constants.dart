import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// App Colors
const Color appPrimaryColor = Color(0xFF7A6EAE);
const Color appSecondaryColor = Color(0xFFB45A9B);
const mulledWine = Color(0XFF624C79);
const violent = Color(0XFF18082A);
const athensGray = Color(0XFFEFEDF2);
const Color blackColor = Color(0XFF000000);
const Color blueColor = Color(0XFF05328D);
const Color whiteColor = Color(0XFFFFFFFF);
const Color darkBlueColor = Color(0XFF040774);
const Color lightBlueColor = Color(0XFFE1E6F0);
const Color skyBlueColor = Color(0XFFCCD6EC);
const Color lightGrey = Color(0XFF4F5D73);
const Color extraLightGrey = Color(0XFFE6E6E6);
const disabledButton = Color(0XFFE3DDEE);
const tan = Color(0XFFCCAE84);
const Color white = Color(0xFFFFFFFF);
const Color designPrimary = Color(0xFF22212E);
const Color darkBrownColor = Color(0xFF5c4d39);
const Color lightGreyColor = Color(0xFFC1C1C1);
const Color mediumGreyColor = Color(0xFF717171);
const Color opaqueGreyColor = Color(0xFFCACACA);

///new color code
///CTA
///

// COLORS FOR Switch Button
const Color selectedSwitchBackgroundColor = Color(0XFF50B460);
const Color unSelectedSwitchBackgroundColorLight = Color(0XFFD0C9D7);
const Color unSelectedSwitchBackgroundColorDark = Color(0XFF767478);
const Color unSelectedSwitchBackgroundColorHighContrast = Color(0XFF4C4C4C);
const Color switchBorderColor = Color(0XFFD4D8DC);

const lightPurple = Color(0XFFECEAEF);

const primaryBackground = Color(0XFFFFFFFF);
const darkPurple = Color(0XFF27242B);
const mulledWineDark = Color(0XFF302A37);
const authContentBackgroundColor = Color(0XFF302A37);

// shimmer colors
const shimmerBaseColor = Color(0xFF383838);
const shimmerHighLightColor = Color(0xFF383838);

const primaryBlue = Color(0xFF096EDE);

///CTA Disable
const disableColor = Color(0xffE5EBFF);
const titleTextColor = Color(0xff0236EF);
const textBlueColor = Color(0xFF096EDE);
const captionTextBlueColor = Color(0xff99ADF4);
const lightBlue = Color(0xffF2F5FF);
const lineSeparatorColor = Color(0xffE5EBFF);
const profileIconBgColor = Color(0xFFe5ebff);
const profileBGColor = Color(0xFFF2F5FF);
const blueDividerColor = Color(0xFF0236EF);

/// previous color
const Color boarderColor = Color(0xffe5e4e4);

///From Who cares app
const Color lightDarkColor = Color(0xFF282929);
const Color clear = Color(0x00000000);
const Color backgroundColor = Color(0xFFF2F5FF);

///New Design Colors
const Color lightGray = Color(0xFFB5B5B5);
const Color darkLightGrey = Color(0xFFF2F2F2);

const Color designPrimaryDark = Color(0xff16161F);
const Color designPrimaryDark2 = Color(0xFF212121);
const Color designWhite = Color(0xffF6F6F6);
const Color designBlack = Color(0xff151515);
const Color designGrey = Color(0xff797981);
const Color designSecondary = Color(0xFF096EDE);
const Color designBorderColor = Color(0xFFE1E6F0);
const Color designErrorColor = Color(0xffCE5454);
const Color designIconColor = Color(0xff43444F);
const Color designNavIconColor = Color(0xff74757E);
const Color designStatusBannerColor = Color(0xffCED5DF);
const Color designDarkBlueColor = Color(0xff215C9E);
const Color designPositiveColor = Color(0xff3DCAB1);
const Color designNegativeColor = Color(0xFFEC4E4E);
const Color designToggleBackColor = Color(0xffEFEFEF);
const Color designBackgroundColor =
    Color(0xFFF0F0F3); //Theme.of(context).scaffoldBackgroundColor
const Color designNoteCellColor =
    Color(0xFFE9EBED); //Theme.of(context).scaffoldBackgroundColor

const Color defaultBorderColor = Color(0xffe1e6f0);
const Color defaultFocussedBorderColor = Color(0xff6c6c6c);
const Color borderColorBue = Color(0xff4376CF);
const Color textGrayColor = Color(0xFF969DA5);
const Color blackGradient = Color(0xFF1C1B25);
const Color greenColor = Color(0xFF099269);
const Color textDarkColor = Color(0xFF565656);
const Color shadowColor = Color(0xFF18274B);
const Color hintColor = Color(0xFF99ADF4);

const Color greyCardBgColor = Color(0xffCED5DF);

const Color shimmerHighlightColor = Color(0xFFE1E3E4);
const Color shimmerBgColorDark = Color(0xFF282929);
Color shimmerBgColorLight = const Color(0xff797981).withOpacity(0.1);

const Color mapCircleColor = Color(0xFF46EBBA);
const Color lightBlueBg = Color(0x0F0038FF);
const Color labelLightColor = Color(0xFF99ADF4);
const Color dividerColorLight = Color(0xFFE5EBFF);

// const Color redColor = Color(0xFFF20000);
const Color claimApprovedColor = Color(0xFF27AE60);
const Color bg = Color(0xFF3A3A46);

Color getWhiteScaffoldBackgroundColor() {
  return Get.isDarkMode ? designPrimaryDark2 : white;
}

Color getTagColor(String tag) {
  switch (tag) {
    case "healthcare":
      return const Color(0xFF0065F2);
    default:
      return const Color(0xFF0065F2);
  }
}
