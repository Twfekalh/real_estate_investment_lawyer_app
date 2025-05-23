import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20document/presentation/widgets/full_image_view.dart'
    show FullImageView;
import 'package:lawyer_app/untility/app_color.dart';

class ImageBaySection extends StatelessWidget {
  final String title;
  final List<String?> images;
  final void Function(int index) onTap;

  const ImageBaySection({
    super.key,
    required this.title,
    required this.images,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.teal,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 20),

            // نص التحذير
            const Text(
              'notice: please make the photo clear and real',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),

            const SizedBox(height: 50),

            // خلفية الشبكة
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, i) {
                  final path = images[i];
                  return GestureDetector(
                    onTap: () => onTap(i),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image:
                            path != null
                                ? DecorationImage(
                                  image: FileImage(File(path)),
                                  fit: BoxFit.cover,
                                )
                                : null,
                      ),
                      child:
                          path == null
                              ? const Icon(
                                Icons.camera_alt,
                                color: Colors.white70,
                              )
                              : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
