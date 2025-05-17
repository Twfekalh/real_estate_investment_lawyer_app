import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/property_type_option.dart';
import 'package:lawyer_app/untility/app_color.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({Key? key}) : super(key: key);

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  String _selectedType = 'Villa';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Property Type:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            PropertyTypeOption(
              label: 'Villa',
              groupValue: _selectedType,
              fillColor: AppColors.darkGreen,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
