import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';

class ScrollableTextWidget extends StatelessWidget {
  final String description;

  ScrollableTextWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100.h, // Set the maximum height of the container
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey),
            ),
            child: SingleChildScrollView(
              child: Text(
                description,
                style: context.label16400,
              ),
            ),
          ),
        ),
      );
  }
}