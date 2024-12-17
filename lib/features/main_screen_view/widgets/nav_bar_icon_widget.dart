import 'package:flutter/material.dart';

class NavigationBarIconWidget extends StatelessWidget {
  final IconData icon;

  const NavigationBarIconWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20,),
        SizedBox(height: 4.0),
      ],
    );
  }
}