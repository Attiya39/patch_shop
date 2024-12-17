import 'package:flutter/material.dart';

class TextAdjusterWidget extends StatelessWidget {
  final Widget child;
  final paddingValue;

  const TextAdjusterWidget(
      {Key? key, required this.child, required this.paddingValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingValue,
        ),
        child: child,
      ),
    );
  }
}
