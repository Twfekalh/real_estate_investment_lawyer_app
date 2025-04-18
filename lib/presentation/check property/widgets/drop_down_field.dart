import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final String selectedValue;
  final Function(String) onChanged;

  const DropdownField({
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        spacing: 10,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 80),
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
              selectedItem,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
