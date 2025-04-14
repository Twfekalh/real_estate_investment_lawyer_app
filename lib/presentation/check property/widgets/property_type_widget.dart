import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_type_option.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({super.key});

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  String? selectedProperty;
  bool showOtherField = false;
  final TextEditingController _otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Property Type :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 85,
          children: [
            PropertyTypeOption(
              label: 'Villa',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
          ],
        ),
      ],
    );
  }

  void _handleSelection(String? value) {
    setState(() {
      selectedProperty = value;
      showOtherField = (value == 'Other');
    });
  }
}
