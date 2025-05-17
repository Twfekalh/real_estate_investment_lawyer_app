import 'package:flutter/material.dart';

import 'package:lawyer_app/presentation/check%20property/data/model/check/data.property.dart';
import 'drop_down_field.dart';
import 'number_picker.dart';

class PropertyDescriptionWidget extends StatelessWidget {
  final CheckProperty property;

  const PropertyDescriptionWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Property Descriptions:', style: TextStyle(fontSize: 15)),
        ),
        NumberPicker(
          label: 'Space:',
          value: int.parse(property.area ?? ''),
          suffix: 'm²',
        ),
        NumberPicker(
          label: 'Number of rooms:',
          value: property.numberOfRooms ?? 0,
        ),
        NumberPicker(
          label: 'Number of bathrooms:',
          value: property.numberOfBathrooms ?? 0,
        ),
        NumberPicker(
          label: 'Property age:',
          value: property.propertyAge ?? 0,
          suffix: 'year',
        ),
        DropdownField(
          label: 'Decoration:',
          items: [property.decoration ?? ''],
          selectedValue: property.decoration ?? '',
          onChanged: (_) {},
        ),
        DropdownField(
          label: 'Kitchen type:',
          items: [property.kitchenType ?? ''],
          selectedValue: property.kitchenType ?? '',
          onChanged: (_) {},
        ),
        DropdownField(
          label: 'Flooring type:',
          items: [property.flooringType ?? ''],
          selectedValue: property.flooringType ?? '',
          onChanged: (_) {},
        ),
        NumberPicker(
          label: 'Overlook from 10:',
          value: property.overlookFrom ?? 0,
        ),
        NumberPicker(
          label: 'Balcony size:',
          value: int.parse(property.balconySize ?? ''),
          suffix: 'm²',
        ),
        DropdownField(
          label: 'Painting type:',
          items: [property.paintingType ?? ''],
          selectedValue: property.paintingType ?? '',
          onChanged: (_) {},
        ),
      ],
    );
  }
}
