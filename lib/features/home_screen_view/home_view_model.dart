import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_matter/base/base_controller.dart';
import 'package:u_matter/data/shared_preferences/user_shared_preferences.dart';
import 'package:u_matter/model/product_response_model.dart';
import 'package:u_matter/utils/enums/home_screen_route_type_enum.dart';
import 'package:u_matter/utils/utils.dart';
import '../../repo/home_repo.dart';
import '../../utils/routes/navigator.dart';

class HomeViewModel extends BaseController {
  UserSharedPreferences userSharedPreferences;
  final HomeRepo _homeRepo;
  RxString role = ''.obs;

  HomeViewModel({
    required INavigator iNavigator,
    required HomeRepo homeRepo,
    required this.userSharedPreferences,
    // required this.notificationsCountService,
  })  : _homeRepo = homeRepo,
        super(iNavigator);

  late TextEditingController searchController;
  late FocusNode searchFocusNode;
  RxBool isLoading = true.obs;
  RxBool isCategoriesLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  // RxString token = ''.obs;
  RxString userId = ''.obs;
  var categoriesList = [].obs;

  RxBool isProductsLoading = true.obs;
  RxBool isErrorProducts = false.obs;
  RxString errorMessageProducts = "".obs;
  var productsList = <ProductResponseModel>[].obs;
  var originalProductsList = <ProductResponseModel>[].obs; /// Original unsorted list
   /// Track the index of the currently active button
    RxInt activeButtonIndex = (-1).obs; /// No button selected initially
    RxBool isSorted = false.obs; /// To track sort state

  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;
  final ScrollController scrollController = ScrollController();
  RxBool isPaginationLoading = false.obs;
  RxBool isFirstTimeLoading = true.obs;
  RxBool isGalleryLoading = true.obs;
  RxBool isGalleryError = false.obs;
  RxString errorMessageGallery = "".obs;

  RxInt selectedCategoryIndex = 0.obs; // Default selection: "View All"

  /// Track the state of each button (true = active, false = inactive)
  var buttonStates = [false, false].obs;
  void toggleButton(int index) {
    buttonStates[index] = !buttonStates[index]; // Toggle state of clicked button
  }

  void setActiveButton(int index) {
    toggleButton(index);
      // If the same button is tapped, deactivate it; otherwise, set it as active
      // if (activeButtonIndex == index) {
      //   activeButtonIndex.value = -1; // Deactivate the button
      // } else {
      //   activeButtonIndex.value = index; // Activate the button
      // }
    toggleSort(index);
  }

  void updateSelectedCategory(int index) async {
    selectedCategoryIndex.value = index;
    buttonStates.value = [false, false];
    activeButtonIndex.value = -1;
    if(index == 0) {
      await getAllProducts();
    } else {
      await getCategoryProducts(category: categoriesList[index-1]);
    }
    // isSelected.value = (selectedCategoryIndex.value == index);
    update(); // Trigger UI rebuild
  }

  void initializeFieldControllers() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
  }

  sortProductsAsc(){
    /// Sort products by price in ascending order
    productsList.sort((a, b) => (a.price as num).compareTo(b.price as num));
  }

  sortProductsDesc(){
    /// Sort products by price in descending order
    productsList.sort((a, b) => (b.price as num).compareTo(a.price as num));
  }

  /// Toggle sorting state
  // void toggleSort(int buttonIndex) {
  //   if (activeButtonIndex.value == buttonIndex) {
  //     if (isSorted.value) {
  //       // Restore original list
  //       productsList.value = originalProductsList;
  //       isSorted.value = false; // Reset sorted state
  //     } else {
  //       // Apply sorting based on button
  //       if (buttonIndex == 0) sortProductsAsc();
  //       if (buttonIndex == 1) sortProductsDesc();
  //       isSorted.value = true; // Set sorted state
  //     }
  //     activeButtonIndex.value = -1; // Deactivate the button
  //   } else {
  //     activeButtonIndex.value = buttonIndex; // Set active button
  //     if (buttonIndex == 0) sortProductsAsc();
  //     if (buttonIndex == 1) sortProductsDesc();
  //     isSorted.value = true; // Set sorted state
  //   }
  // }
  void toggleSort(int buttonIndex) {
    if (activeButtonIndex.value == buttonIndex) {
      // If the button is pressed again (deactivating)
      if (isSorted.value) {
        debugPrint("originalProductsList: ${originalProductsList.length}");
        // Restore the original unsorted list
        productsList.assignAll(originalProductsList);
        // productsList.value = originalProductsList;
        isSorted.value = false; // Mark as unsorted
        activeButtonIndex.value = -1; // Deactivate the button
      }
    } else {
      // If a new button is pressed
      activeButtonIndex.value = buttonIndex; // Set the active button
      if (buttonIndex == 0) {
        sortProductsAsc();
      } else if (buttonIndex == 1) {
        sortProductsDesc();
      }
      isSorted.value = true; // Mark as sorted
    }
  }


  @override
  void onInit() async {
    initializeFieldControllers();
    // role.value = await userSharedPreferences.getUserRole();
    final isNetworkConnected = await Utils.isConnectedToInternet();
    // debugPrint("homeController Role has been set to $role");
    debugPrint("isNetworkConnected onInit() $isNetworkConnected");

    debugPrint("Home Previous Route ${Get.previousRoute}");
    fetchMultipleData();
    super.onInit();

  }

  void fetchMultipleData() async {
    try {
      isLoading.value = true;
      await Future.wait([
        getAllCategories(),
        getAllProducts(),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  Future getAllCategories() async {
    isError.value = false;
    errorMessage.value = "";
    isCategoriesLoading(true);

    final result =
    await _homeRepo.getAllCategories();

    isCategoriesLoading(false);

    result.fold((left) {
      isError.value = true;
      errorMessage.value = left.toString();

      // Show an error message using a SnackBar.
      // Utils.snackBar(left.toString(), Get.overlayContext!);
      debugPrint("All Categories error message: ${left.toString()}");
    }, (right) async {
        // Once the API call is successful, set the login loading state to false.
        isCategoriesLoading(false);
        categoriesList.value = right;
        debugPrint("api response:$right");

    });
  }

  Future getAllProducts() async {
    isErrorProducts.value = false;
    errorMessageProducts.value = "";
    isProductsLoading(true);

    final result =
    await _homeRepo.getAllProducts();

    isProductsLoading(false);

    result.fold((left) {
      isErrorProducts.value = true;
      errorMessageProducts.value = left.toString();

      // Show an error message using a SnackBar.
      // Utils.snackBar(left.toString(), Get.overlayContext!);
      debugPrint("All Products error message: ${left.toString()}");
    }, (right) async {
      // Once the API call is successful, set the login loading state to false.
      isProductsLoading(false);
      productsList.value = right;
      originalProductsList.assignAll(right);
      debugPrint("products api response:$right");

    });
  }

  Future getCategoryProducts({required String category}) async {
    isErrorProducts.value = false;
    errorMessageProducts.value = "";
    isProductsLoading(true);

    final result =
    await _homeRepo.getCategoryProducts(category: category);

    isProductsLoading(false);

    result.fold((left) {
      isErrorProducts.value = true;
      errorMessageProducts.value = left.toString();

      // Show an error message using a SnackBar.
      // Utils.snackBar(left.toString(), Get.overlayContext!);
      debugPrint("Category Products error message: ${left.toString()}");
    }, (right) async {
      // Once the API call is successful, set the login loading state to false.
      isProductsLoading(false);
      productsList.value = right;
      originalProductsList.assignAll(right);
      debugPrint("category products api response:$right");

    });
  }
  // Future getAllServices(GenderTypeEnum gender) async {
  //   isError.value = false;
  //   errorMessage.value = "";
  //   isCategoriesLoading(true);
  //
  //   debugPrint("GetToken $token");
  //
  //   final result =
  //   await _homeRepo.getAllServices(gender: gender, token: token.value);
  //
  //   isCategoriesLoading(false);
  //
  //   result.fold((left) {
  //     isError.value = true;
  //     errorMessage.value = left.toString();
  //
  //     // Show an error message using a SnackBar.
  //     // Utils.snackBar(left.toString(), Get.overlayContext!);
  //     debugPrint("All Services error message: ${left.toString()}");
  //   }, (right) async {
  //     if (right.success!) {
  //       // Once the API call is successful, set the login loading state to false.
  //       isCategoriesLoading(false);
  //       gender.index == 0 ? categoriesList.value = right.data!.data! : femaleServicesList.value = right.data!.data!;
  //       // Utils.snackBar("Request submitted successfully ✓", context);
  //       debugPrint("api response:${right.toString()}");
  //       // iNavigator.pop();
  //     } else {
  //       isCategoriesLoading(false);
  //       // Show an error message using a SnackBar.
  //       // Utils.snackBar(right.message, context);
  //       errorMessage.value = right.message.toString();
  //       // Debug print the error message.
  //       debugPrint("AllServices error: ${right.message}");
  //     }
  //   });
  // }
  // Future viewImageFile({required String fileName}) async {
  //   isImageError.value = false;
  //   errorMessageImage.value = "";
  //   isImageLoading(true);
  //
  //   final result =
  //   await _homeRepo.viewImageFile(fileName: fileName);
  //
  //   isImageLoading(false);
  //
  //   result.fold((left) {
  //     isImageError.value = true;
  //     errorMessageImage.value = left.toString();
  //
  //     // Show an error message using a SnackBar.
  //     // Utils.snackBar(left.toString(), Get.overlayContext!);
  //     debugPrint("ViewImageFile error message: ${left.toString()}");
  //   }, (right) async {
  //       // Once the API call is successful, set the login loading state to false.
  //       isImageLoading(false);
  //       imageFile.value = right;
  //       debugPrint("ViewImageFile api response:${right.toString()}");
  //   });
  // }
  void routeToScreen(ScreenNameEnum nameOfScreen) {
    switch (nameOfScreen) {
      // case ScreenNameEnum.goToNotificationsScreenView:
      //   {
      //     iNavigator.pushNamed(Routes.notificationsScreenView
      //         //     , arguments: {
      //         //   'title': 'New Notification',
      //         //   'message': 'New Push Notification'
      //         // }
      //         );
      //     break;
      //   }

      default:
        Utils.snackBar('no_route_found'.tr.capitalize!, Get.overlayContext!);
    }
  }
}
