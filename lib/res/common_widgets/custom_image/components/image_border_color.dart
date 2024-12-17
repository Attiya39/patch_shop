import 'package:flutter/material.dart';

class ImageBorderColor extends StatelessWidget {
  const ImageBorderColor({
    Key? key,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
