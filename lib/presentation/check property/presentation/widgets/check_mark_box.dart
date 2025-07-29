import 'package:flutter/material.dart';

class CheckMarkBox extends StatefulWidget {
  const CheckMarkBox({super.key});

  @override
  _CheckMarkBoxState createState() => _CheckMarkBoxState();
}

class _CheckMarkBoxState extends State<CheckMarkBox> {
  bool isChecked = false;

  void _toggleCheck() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheck,
      child: Container(
        width: 15,
        height: 15,
        decoration: ShapeDecoration(
          color: isChecked ? Colors.green : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.black38),
          ),
        ),
        child:
            isChecked
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
      ),
    );
  }
}
