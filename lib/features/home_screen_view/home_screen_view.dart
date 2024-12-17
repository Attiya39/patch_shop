import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/home_screen_view/home_view_model.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_primary_button.dart';
import 'package:u_matter/res/common_widgets/buttons/custom_rounded_button.dart';
import 'package:u_matter/utils/constants/k_images.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

import '../../res/common_widgets/containers/info_card_widget.dart';
import '../../res/common_widgets/error_views/error_view.dart';
import '../../res/common_widgets/input_fields/design_text_field.dart';
import '../../utils/constants/color_constants.dart';

class HomeView extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h), // Total height of the AppBar
        child: AppBar(
          backgroundColor: appPrimaryColor, // Your primary app color
          elevation: 0,

          /// Removes the shadow
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                /// AppBar Background
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 60.h,
                  // Adjust height for purple area
                  child: Container(
                    color: appPrimaryColor,
                  ),
                ),

                /// Search Bar Positioned
                Positioned(
                  bottom: -23.h,

                  /// Place search bar below AppBar
                  left: 16.w,
                  right: 16.w,
                  child: Material(
                    elevation: 4,

                    /// Adds shadow under search bar
                    borderRadius: BorderRadius.circular(8.r),
                    child: Obx((){
                      debugPrint("isDataLoading ${controller.isLoading.value ||
                          controller.isProductsLoading.value ||
                          controller.isCategoriesLoading.value}");
                      return IgnorePointer(
                        ignoring: (controller.isLoading.value ||
                            controller.isProductsLoading.value ||
                            controller.isCategoriesLoading.value),
                        child: DesignTextField(
                          height: 56.h,
                          width: context.width,
                          borderColor: Colors.transparent,

                          /// Remove visible border
                          prefixIcon: SVGIcons.searchIcon,
                          controller: controller.searchController,
                          inputType: "text",
                          hint: "What are you looking for?",
                          hintColor: mediumGreyColor,
                          autofillHints: const [AutofillHints.name],
                        ),
                      );
                    }),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                )
              : controller.isError.value
                  ? Center(
                      child: ErrorView(
                        onRetry: () => controller.fetchMultipleData(),
                        serverErrorText: controller.errorMessage.value,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          // horizontal: 24.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            if (controller.categoriesList.isNotEmpty)
                              CategoriesWidget(
                                title: "Choose from any category",
                                categoriesList: Obx(() {
                                  debugPrint(
                                      "selectedCategoryIndex ${controller.selectedCategoryIndex.value}");
                                  return ListView.builder(
                                      // padding: EdgeInsets.only(right: 30.h),
                                      // padding: EdgeInsets.zero,
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.categoriesList.length + 1,
                                      // Add 1 for "View All"
                                      itemBuilder: (context, index) {
                                        return () {
                                          var isSelected = (controller
                                                  .selectedCategoryIndex
                                                  .value ==
                                              index);

                                          /// Check if it's the "View All" button index
                                          if (index == 0) {
                                            /// "View All" Button
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15.w),
                                              child: CustomRoundedButton(
                                                title: "View All",
                                                // Special Title
                                                titleImage:
                                                    SVGIcons.uploadRoundedIcon,
                                                // Optional: Add a different icon
                                                isSelected: isSelected,
                                                onTap: controller
                                                        .isProductsLoading.value
                                                    ? null
                                                    : () {
                                                        controller
                                                            .updateSelectedCategory(
                                                                index);
                                                        // Perform action for View All
                                                        debugPrint(
                                                            "View All tapped");
                                                        // Example: Navigate to a full category page
                                                        // controller.iNavigator.pushNamed(Routes.allCategoriesScreenView);
                                                      },
                                              ),
                                            );
                                          }
                                          final servicesObj = controller
                                              .categoriesList
                                              .toList()[index - 1];

                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.w),
                                            child: CustomRoundedButton(
                                              title: servicesObj,
                                              titleImage:
                                                  // "${AppUrl.viewImageFile}?FileName=${servicesObj.fileName}",
                                                  SVGIcons.bellIcon,
                                              isSelected: isSelected,
                                              onTap: () {
                                                controller
                                                    .updateSelectedCategory(
                                                        index);
                                                debugPrint("View All tapped");
                                              },
                                            ),
                                          );
                                        }();
                                      });
                                }),
                              ),
                            controller.isProductsLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: appPrimaryColor,
                                    ),
                                  )
                                : controller.isErrorProducts.value
                                    ? Center(
                                        child: ErrorView(
                                          onRetry: () =>
                                              controller.fetchMultipleData(),
                                          serverErrorText: controller
                                              .errorMessageProducts.value,
                                        ),
                                      )
                                    : (controller.productsList.isNotEmpty)
                                        ? ProductsWidget(
                                            title:
                                                "${controller.productsList.length} products to choose from",
                                            productsList: Obx(() {
                                              debugPrint(
                                                  "isSelected ${controller.selectedCategoryIndex.value}");
                                              return Container(
                                                padding: EdgeInsets.only(bottom: 120.h,),
                                                height: context.height * 0.6,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomPrimaryButton(
                                                          height: 32.h,
                                                          width: context.width / 2.5,
                                                          onTap: (){
                                                            controller.toggleSort(0); // Toggle for ascending order button
                                                            // if(controller.activeButtonIndex.value == 0){}
                                                            // else {
                                                            //   controller
                                                            //       .sortProductsAsc();
                                                            // }
                                                            // controller.setActiveButton(0);
                                                          },
                                                          backgroundColor: controller.activeButtonIndex.value == 0
                                                              ? appPrimaryColor
                                                          : opaqueGreyColor,
                                                          textStyle: TextStyle(
                                                            color:  controller.activeButtonIndex.value == 0
                                                                ? whiteColor : blackColor,
                                                            fontSize: 15.sp,
                                                          ),
                                                          title: 'Lowest price first'.tr.capitalize!,
                                                          borderRadius: 4.r,
                                                        ),
                                                        SizedBox(width: 10.w,),
                                                        CustomPrimaryButton(
                                                          height: 32.h,
                                                          width: context.width / 2.5,
                                                          onTap: (){
                                                            controller.toggleSort(1); // Toggle for descending order button
                                                            // if(controller.activeButtonIndex.value == 1){}
                                                            // else {
                                                            //   controller
                                                            //       .sortProductsDesc();
                                                            // }
                                                            // controller.setActiveButton(1);
                                                          },
                                                          backgroundColor: controller.activeButtonIndex.value == 1
                                                              ? appPrimaryColor
                                                              : opaqueGreyColor,
                                                          textStyle: TextStyle(
                                                            color: controller.activeButtonIndex.value == 1
                                                                ? whiteColor : blackColor,
                                                            fontSize: 15.sp,
                                                          ),
                                                          title: 'Highest price first'.tr.capitalize!,
                                                          borderRadius: 4.r,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h,),
                                                    Expanded(
                                                      child: GridView.builder(
                                                        physics:
                                                            const BouncingScrollPhysics(
                                                                parent:
                                                                    AlwaysScrollableScrollPhysics()),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          // 2 items in a row
                                                          crossAxisSpacing: 8.w,
                                                          // Space between columns
                                                          // mainAxisSpacing: 10.h, // Space between rows
                                                          childAspectRatio: 140 /
                                                              190, // Adjust as needed for the card layout
                                                        ),
                                                        itemCount: controller
                                                            .productsList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final productObj =
                                                              controller.productsList
                                                                  .toList()[index];

                                                          return InfoCardWidget(
                                                            title: productObj.title,
                                                            titleImage:
                                                                productObj.image,
                                                            subTitle: productObj
                                                                .description,
                                                            price:
                                                                "\$${productObj.price}",
                                                            onTap: () {
                                                              debugPrint("onTap");
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          )
                                        : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }

  ///  Get Length of List
  int getLengthOfList(List list) {
    // This 'getLengthOfList' function is made to check if the 'isPaginationLoading' is true then increase the total length of list
    // ... by 1 so that on the last index we can show loader in the UI on top when paginating
    if (controller.isPaginationLoading.value) {
      debugPrint(
          "isPaginationLoading max: ${controller.isPaginationLoading.value}");
      return list.length + 1;
    }
    return list.length;
  }

  void showCustomDialog(BuildContext context, Widget dialogContent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          child: dialogContent,
        );
      },
    );
  }
}

class InfoCardListWidget extends StatelessWidget {
  const InfoCardListWidget({
    super.key,
    required this.title,
    required this.itemsList,
  });

  // final HomeViewModel controller;
  final String title;
  final Widget itemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.left,
            title,
            style: context.label16700,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 175.h,
            child: itemsList,
            // ListView(
            //   // shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   children: itemsList,
            // ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.title,
    // required this.onTap,
    required this.categoriesList,
  });

  // final HomeViewModel controller;
  final String title;

  // final VoidCallback onTap;
  final Widget categoriesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.label16700,
              ),
              // GestureDetector(
              //     onTap: onTap,
              //     child: Text(
              //       "see all >",
              //       style: context.label12700.copyWith(
              //         color: appSecondaryColor,
              //       ),
              //     )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            // color: Colors.orange,
            height: 130.h,
            child: categoriesList,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: itemsList,
            // ),
          ),
          // GridView(
          //   // padding: EdgeInsets.symmetric(
          //   //   horizontal: 10.w,
          //   // ),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     crossAxisSpacing: 8.w,
          //     mainAxisSpacing: 8.w,
          //   ),
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: itemsList,
          // ),
        ],
      ),
    );
  }
}

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.title,
    required this.productsList,
  });

  final String title;
  final Widget productsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.label16700,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          productsList, // GridView will respect the SizedBox height
        ],
      ),
    );
  }
}
