import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/untility/app_color.dart';

class HelpViewItem extends StatelessWidget {
  const HelpViewItem({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        width: 345,
        height: 56,
        decoration: ShapeDecoration(
          color: const Color(0x9E9A8AEC),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0x755B5B5B)),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: Icon(
                CupertinoIcons.question_circle_fill,
                color: AppColors.background,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
