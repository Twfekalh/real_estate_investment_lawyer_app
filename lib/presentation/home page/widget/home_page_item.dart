import 'package:flutter/material.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({
    super.key,
    required this.mainText,
    required this.secondText,
    required this.color,
    required this.imageICon,
  });

  final String mainText;
  final String secondText;
  final Color color;
  final String imageICon;

  Color? getIconColor() {
    if (imageICon == AppAssets.business) {
      return AppColors.darkGreen;
    } else if (imageICon == AppAssets.law) {
      return const Color(0xFF001F3F);
    } else if (imageICon == AppAssets.complate) {
      return AppColors.pink800;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black.withAlpha(117)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
          left: 12.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(imageICon), color: getIconColor()),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Flexible(
                    child: Text(
                      '$secondText\n',
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
