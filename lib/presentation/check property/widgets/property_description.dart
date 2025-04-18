import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/drop_down_field.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/number_picker.dart';

class PropertyDescriptionWidget extends StatefulWidget {
  const PropertyDescriptionWidget({super.key});

  @override
  State<PropertyDescriptionWidget> createState() =>
      _PropertyDescriptionWidgetState();
}

class _PropertyDescriptionWidgetState extends State<PropertyDescriptionWidget> {
  int space = 350;
  int rooms = 4;
  int bathrooms = 2;
  int propertyAge = 2;
  int overlook = 4;
  int balconySize = 100;

  final List<String> decorations = ['deluxe'];
  final List<String> kitchenTypes = ['western'];
  final List<String> flooringTypes = ['granite'];
  final List<String> paintingTypes = ['regular'];

  String selectedDecoration = 'deluxe';
  String selectedKitchen = 'western';
  String selectedFlooring = 'granite';
  String selectedPainting = 'regular';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Property descriptions:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        NumberPicker(label: 'Space:', value: space, suffix: 'm²'),
        NumberPicker(label: 'Number of rooms:', value: rooms),
        NumberPicker(label: 'Number of bathrooms:', value: bathrooms),
        NumberPicker(
          label: 'Property age:',
          value: propertyAge,

          suffix: 'year',
        ),
        DropdownField(
          label: 'Decoration:',
          items: decorations,
          selectedValue: selectedDecoration,
          onChanged: (val) => setState(() => selectedDecoration = val),
        ),
        DropdownField(
          label: 'Kitchen type:',
          items: kitchenTypes,
          selectedValue: selectedKitchen,
          onChanged: (val) => setState(() => selectedKitchen = val),
        ),
        DropdownField(
          label: 'Flooring type:',
          items: flooringTypes,
          selectedValue: selectedFlooring,
          onChanged: (val) => setState(() => selectedFlooring = val),
        ),
        NumberPicker(label: 'Overlook from 10:', value: overlook),
        NumberPicker(label: 'Balcony size:', value: balconySize, suffix: 'm²'),
        DropdownField(
          label: 'Painting type:',
          items: paintingTypes,
          selectedValue: selectedPainting,
          onChanged: (val) => setState(() => selectedPainting = val),
        ),
      ],
    );
  }
}
