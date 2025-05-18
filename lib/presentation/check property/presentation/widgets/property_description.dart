// property_description.dart
import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/drop_down_field.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/number_picker.dart';

class PropertyDescriptionWidget extends StatefulWidget {
  final int space;
  final int rooms;
  final int bathrooms;
  final int propertyAge;
  final int overlook;
  final int balconySize;
  final String selectedDecoration;
  final String selectedKitchen;
  final String selectedFlooring;
  final String selectedPainting;

  const PropertyDescriptionWidget({
    super.key,
    required this.space,
    required this.rooms,
    required this.bathrooms,
    required this.propertyAge,
    required this.overlook,
    required this.balconySize,
    required this.selectedDecoration,
    required this.selectedKitchen,
    required this.selectedFlooring,
    required this.selectedPainting,
  });

  @override
  State<PropertyDescriptionWidget> createState() =>
      _PropertyDescriptionWidgetState();
}

class _PropertyDescriptionWidgetState extends State<PropertyDescriptionWidget> {
  late int space;
  late int rooms;
  late int bathrooms;
  late int propertyAge;
  late int overlook;
  late int balconySize;

  final List<String> decorations = ['deluxe'];
  final List<String> kitchenTypes = ['western'];
  final List<String> flooringTypes = ['granite'];
  final List<String> paintingTypes = ['regular'];

  late String selectedDecoration;
  late String selectedKitchen;
  late String selectedFlooring;
  late String selectedPainting;

  @override
  void initState() {
    super.initState();
    space = widget.space;
    rooms = widget.rooms;
    bathrooms = widget.bathrooms;
    propertyAge = widget.propertyAge;
    overlook = widget.overlook;
    balconySize = widget.balconySize;
    selectedDecoration = widget.selectedDecoration;
    selectedKitchen = widget.selectedKitchen;
    selectedFlooring = widget.selectedFlooring;
    selectedPainting = widget.selectedPainting;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
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
        SizedBox(height: 7),
      ],
    );
  }
}
