import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:u_matter/features/splash_screen_view/services/splash_services.dart';
import 'package:u_matter/utils/constants/k_images.dart';

import '../../utils/constants/color_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.redirectToHomeScreenVIEW();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.07,
                image: AssetImage(SVGImages.appLogoBg,), // Background image path
                fit: BoxFit.fitHeight, // Cover the entire screen
              ),
            ),
          ),

          /// Content on top of the background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CustomImage(
                //   imagePath: SVGImages.uMatterSpaBannerLogoPNG,
                //   height: 320.h,
                //   width: 306.w,
                //   fit: BoxFit.contain,
                // ),
                SizedBox(height: screenHeight * .08),
                const SpinKitWaveSpinner(
                  color: appSecondaryColor,
                  trackColor: appPrimaryColor,
                  duration: Duration(seconds: 3),
                  curve: Curves.fastOutSlowIn,
                  waveColor: appPrimaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
