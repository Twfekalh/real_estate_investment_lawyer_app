import 'package:flutter/material.dart';
import 'package:lawyer_app/untility/app_assests.dart';

class ProfileInfoRow extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  final Color iconColor;
  final double iconSize;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.iconColor = Colors.black54,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: iconSize,
            height: iconSize,
            color: iconColor,
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: onTap,
          //   child: Image.asset(
          //     AppAssets.editIcon,
          //     width: 20,
          //     height: 20,
          //     color: Colors.grey[800],
          //   ),
          // ),
        ],
      ),
    );
  }
}
