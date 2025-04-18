import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/untility/app_color.dart';

class NumberPicker extends StatelessWidget {
  final String label;
  final int value;
  final String? suffix;

  const NumberPicker({
    required this.label,
    required this.value,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.black82,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: 107,
            height: 26.63,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              '$value${suffix != null ? ' $suffix' : ''}',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
