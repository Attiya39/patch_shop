import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:u_matter/res/common_widgets/containers/text_adjuster_widget.dart';
import 'package:u_matter/utils/constants/k_images.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

import '../../../utils/constants/color_constants.dart';
import '../custom_image/custom_image.dart';

// class CustomRoundedButton extends StatelessWidget {
//   const CustomRoundedButton({
//     super.key,
//     this.titleImage,
//     // required this.currentLocale,
//     this.title,
//     this.onTap,
//   });
//
//   final String? titleImage;
//   final String? title;
//   // final RxString currentLocale;
//   final VoidCallback? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             height: 75.h,
//               width: 75.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle, // This makes it an ellipse (circle)
//               // color: Colors.orange, // Background color of the ellipse
//               // borderRadius: BorderRadius.circular(60.r),
//             ),
//             child: ClipOval(
//               child: CustomImage(
//                 imagePath: titleImage ?? SVGIcons.bellIcon,
//                 // height: 90.h,
//                 // width: 90.h,
//                 // fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           // currentLocale.value == "en,US"
//           // ? Text(
//           //   title ?? 'notifications_button_key'.tr,
//           //   // 'Notifications',
//           //   textAlign: TextAlign.center,
//           //   maxLines: 2,
//           //   style: context.label15700.copyWith(
//           //     fontStyle: FontStyle.italic,
//           //   ),
//           // )
//           // :
//           TextAdjusterWidget(
//             paddingValue: 0.0,
//             child:
//           Container(
//             width: 75.w,
//             child: Text(
//               title!.capitalize! ?? 'services'.tr.capitalize!,
//               // 'Notifications',
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               style: context.label12400,
//             ),
//           ),
//           ),
//             // Flexible(
//             //   child: Padding(
//             //     padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
//             //     child: Text(
//             //       title!.capitalize! ?? 'services'.tr.capitalize!,
//             //           // 'Notifications',
//             //       textAlign: TextAlign.center,
//             //       maxLines: 2,
//             //       style: context.label12400,
//             //     ),
//             //   ),
//             // ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    this.titleImage,
    this.title,
    this.onTap,
    this.isSelected = false, // Add isSelected parameter
  });

  final String? titleImage;
  final String? title;
  final VoidCallback? onTap;
  final bool isSelected; // Flag to determine selection state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Colors.green, width: 3) // Green border if selected
                  : null, // No border if not selected
            ),
            child: ClipOval(
              child: CustomImage(
                imagePath: titleImage ?? SVGIcons.bellIcon,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 75.w,
            child: Text(
              title!.capitalize ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: context.label12400,
            ),
          ),
        ],
      ),
    );
  }
}
