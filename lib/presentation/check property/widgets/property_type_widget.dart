import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_type_option.dart';

class PropertyTypeWidget extends StatelessWidget {
  const PropertyTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(height: 2),
          Row(
            children: const [
              PropertyTypeOption(
                label: 'Villa',
                groupValue: 'Villa',
                onChanged: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
