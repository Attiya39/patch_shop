import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:u_matter/utils/extensions/size_extensions.dart';

import '../../../utils/constants/color_constants.dart';

class GalleryDialog extends StatefulWidget {
  final String imageUrl;
  const GalleryDialog({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _GalleryDialogState createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  late PhotoViewController _photoViewController;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _photoViewController = PhotoViewController()..scale = _scale;
  }

  @override
  void dispose() {
    _photoViewController.dispose();
    super.dispose();
  }

  void _zoomIn() {
    setState(() {
      _scale = (_scale * 1.2).clamp(1.0, 5.0); // Set max scale
      _photoViewController.scale = _scale;
    });
  }

  void _zoomOut() {
    setState(() {
      debugPrint("Scale $_scale");
      if(_scale != 1.0) {
        _scale = (_scale / 1.2).clamp(1.0, 5.0); // Set min scale
        debugPrint("minScale $_scale");
        _photoViewController.scale = _scale;
      }
    });

  }

  void _resetZoom() {
    setState(() {
      _scale = 1.0;
      _photoViewController.scale = _scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: 5.h,),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300.h,
            width: context.width,
            child: PhotoView(
              controller: _photoViewController,
              imageProvider: CachedNetworkImageProvider(widget.imageUrl),
              backgroundDecoration: BoxDecoration(color: whiteColor),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: _zoomIn,
              ),
              IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: _zoomOut,
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _resetZoom,
              ),
              // ElevatedButton(
              //   onPressed: () => Navigator.of(context).pop(),
              //   child: Text("Close"),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
