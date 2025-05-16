import 'package:flutter/material.dart';

class PropertyTypeOption extends StatelessWidget {
  final String label;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  final Color fillColor;

  const PropertyTypeOption({
    super.key,
    required this.label,
    required this.groupValue,
    required this.onChanged,
    this.fillColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: fillColor,
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
