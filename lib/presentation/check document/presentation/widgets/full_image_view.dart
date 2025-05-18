import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImageView extends StatelessWidget {
  final String imagePath;

  const FullImageView({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: AssetImage(imagePath),
        backgroundDecoration: BoxDecoration(color: Colors.black),
      ),
    );
  }
}
