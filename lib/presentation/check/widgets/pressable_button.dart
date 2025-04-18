import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color initialColor;
  final Color pressedColor;

  const PressableButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.initialColor,
    required this.pressedColor,
  });

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // تغيير الحالة إلى pressed
        setState(() {
          isPressed = true;
        });
        // تنفيذ وظيفة التنقل أو الدالة الأخرى
        widget.onTap();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isPressed ? widget.pressedColor : widget.initialColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
