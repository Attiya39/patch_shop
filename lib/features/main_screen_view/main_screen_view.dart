import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/features/account_screen_view/account_screen_binding.dart';
import 'package:u_matter/features/account_screen_view/account_screen_view.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_binding.dart';
import 'package:u_matter/features/cart_screen_view/cart_screen_view.dart';
import 'package:u_matter/features/home_screen_view/home_screen_binding.dart';
import 'package:u_matter/features/home_screen_view/home_screen_view.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_binding.dart';
import 'package:u_matter/features/inbox_screen_view/inbox_screen_view.dart';
import 'package:u_matter/features/main_screen_view/main_screen_view_model.dart';
import 'package:u_matter/features/main_screen_view/widgets/nav_bar_icon_widget.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_binding.dart';
import 'package:u_matter/features/sell_screen_view/sell_screen_view.dart';
import 'package:u_matter/utils/constants/color_constants.dart';

class MainScreenView extends GetView<MainScreenViewModel> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        key: _scaffoldKey,
        body: SizedBox.expand(
          child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.updateSelectedIndex(index);
              controller.navigationIndex.value = index;
              controller.previousIndex.value = controller.selectedIndex.value;

                  // Load bindings dynamically based on the index
                  if (index == 0) {
                    HomeScreenBinding().dependencies(); // Bind HomeController for HomeView
                  } else if (index == 1) {
                  CartScreenBinding().dependencies();
                  } else if (index == 2) {
                    SellScreenBinding().dependencies();
                  }
                  else if (index == 3) {
                    InboxScreenBinding().dependencies();
                  }
                  else if (index == 4) {
                    AccountScreenBinding().dependencies();
                  }


            },
            children:
            [
             HomeView(),
              CartScreenView(),
              SellScreenView(),
              InboxScreenView(),
              AccountScreenView(),
            ],

          ),
        ),
        bottomNavigationBar: Container(
          height: 68.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color (fully opaque black)
                offset: const Offset(0, -20), // Shadow position: x = 0, y = -20
                blurRadius: 20.r, // Softness of the shadow
                spreadRadius: 0.r, // No extra spread
              ),
            ],
            border: Border(
              top: BorderSide(
                color: whiteColor,// Set the border color
                width: 1.w, // Set the border width
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: BottomNavigationBar(
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 12.sp,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.navigationIndex.value,
                  showUnselectedLabels: true,
                  unselectedItemColor:blackColor,
                  selectedItemColor: appSecondaryColor,
                  items:
                  const [
                    BottomNavigationBarItem(
                      activeIcon: NavigationBarIconWidget(
                        icon: CupertinoIcons.search,
                      ),
                      icon: NavigationBarIconWidget(
                        icon: CupertinoIcons.search,
                      ),
                      label: 'Discover',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: NavigationBarIconWidget(
                        icon: Icons.shopping_bag_outlined,
                      ),
                      icon: NavigationBarIconWidget(
                        icon: Icons.shopping_bag_outlined,
                      ),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: NavigationBarIconWidget(
                        icon: CupertinoIcons.add_circled,
                      ),
                      icon: NavigationBarIconWidget(
                        icon: CupertinoIcons.add_circled,
                      ),
                      label: 'Sell',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: NavigationBarIconWidget(
                        icon: Icons.inbox,
                      ),
                      icon: NavigationBarIconWidget(
                        icon: Icons.inbox,
                      ),
                      label: 'Inbox',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: NavigationBarIconWidget(
                        icon: Icons.person_2_outlined,
                      ),
                      icon: NavigationBarIconWidget(
                        icon: Icons.person_2_outlined,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  onTap: (index) {
                    controller.navigationIndex.value = index;
                    controller.selectedIndex.value = index;
                    controller.previousIndex.value = controller.selectedIndex.value;
                    debugPrint("PreviousIndex ${controller.previousIndex.value}");
                    controller.pageController.jumpToPage(index);
                  },
                ),
              ),
              Positioned(
                left:
                (context.width / 5) *
                    controller.navigationIndex.value,
                bottom: 65.h,
                child: Container(
                  height: 2.h,
                  // Set your desired indicator height
                  width: context.width / 5,
                  // Set the width based on the number of items
                  color: appSecondaryColor, // Set your desired indicator color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

