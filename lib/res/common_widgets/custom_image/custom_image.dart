import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_matter/utils/constants/color_constants.dart';
import 'components/image_border_color.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.height = double.infinity,
    this.shimmerRadius = 5,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.matchTextDirection = false,
    this.isIcon = false,
    this.showShimmer = true,
    this.onErrorBackgroundColor,
    this.bodyColor,
    this.coverColor,
    this.errorWidget,
    this.placeHolderImage,
  }) : super(key: key);

  final String imagePath;
  final BoxFit fit;
  final double height;
  final double? width;
  final double shimmerRadius;
  final Color? color;
  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final bool matchTextDirection;
  final bool isIcon;
  final bool showShimmer;
  final Color? onErrorBackgroundColor;
  final Widget? errorWidget;

  final Color? bodyColor;
  final Color? coverColor;
  final String? placeHolderImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: borderRadius,
      child: isIcon == true
          ? _getImageView(size, context, errorWidget: errorWidget)
          : ImageBorderColor(
              borderRadius: borderRadius,
              child: _getImageView(size, context, errorWidget: errorWidget),
            ),
    );
  }

  _getImageView(Size size, BuildContext context, {Widget? errorWidget}) {
    return _getImageWidget(imagePath, size, context, errorWidget: errorWidget);
  }

  Widget _getImageWidget(String path, Size size, BuildContext context,
      {Widget? errorWidget}) {
    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www.')) {
      if (path.endsWith("svg")) {
        try {
          return SvgPicture.network(
            path,
            fit: fit,
            width: width ?? size.width,
            height: height,
            color: color,
            cacheColorFilter: true,
            matchTextDirection: matchTextDirection,
          );
        } catch (e) {
          debugPrint("SVG Error");
          return _errorImageView(context);
        }
      } else {
        return CachedNetworkImage(
          imageUrl: path,
          width: width ?? size.width,
          height: height,
          fit: fit,
          matchTextDirection: matchTextDirection,
          placeholder: (context, url) => path.isEmpty
              ? SvgPicture.asset(
                  //  placeHolderImage ?? SVGIcons.logo,
                  placeHolderImage ?? "",
                  fit: BoxFit.contain,
                  //  color: context.primaryButtonColor.withOpacity(.5),
                  color: Colors.blue.withOpacity(.5),
                )
              : showShimmer
                  ? Container(
                      color: blackColor.withOpacity(0.3),
                    )
                  // PlaceHolderLoader(
                  //   bodyColor: bodyColor,
                  //   coverColor: coverColor,
                  //   height: height,
                  // )
                  : Container(),
          errorWidget: (context, url, error) =>
              errorWidget ?? _errorImageView(context),
        );
      }
    } else if (path.endsWith("svg")) {
      try {
        return SvgPicture.asset(
          path,
          fit: fit,
          width: width ?? size.width,
          height: height,
          color: color,
          matchTextDirection: matchTextDirection,
        );
      } catch (e) {
        return _errorImageView(context);
      }
    } else {
      return Image.asset(
        path,
        fit: fit,
        width: width ?? size.width,
        height: height,
        color: color,
        matchTextDirection: matchTextDirection,
        errorBuilder: (context, _, stackTrace) => _errorImageView(context),
      );
    }
  }

  _errorImageView(BuildContext context) {
    return isIcon
        ? SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: designBackgroundColor,
                  color: Colors.black12,
                ),
              ),
            ),
          )
        : Container(
            width: width,
            height: height,
            // color: onErrorBackgroundColor ?? mulledWine.withOpacity(.05),
            color: onErrorBackgroundColor ?? Colors.purple.withOpacity(.05),
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              //  placeHolderImage ?? SVGIcons.person,
              placeHolderImage ?? "",
              width: width,
              height: height,
              matchTextDirection: matchTextDirection,
              //  color: context.primaryButtonColor.withOpacity(.5),
              color: Colors.black12.withOpacity(.5),
            ),
          );
  }
}
